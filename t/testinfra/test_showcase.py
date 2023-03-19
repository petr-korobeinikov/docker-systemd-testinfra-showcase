import testinfra.modules.service

testinfra.modules.service.Service.get_module_class = classmethod(
    lambda *args, **kwargs: testinfra.modules.service.SystemdService
)

testinfra_hosts = ["ubuntu:ubuntu@localhost"]


def test_nginx(host):
    sut = "nginx"

    assert host.package(sut).is_installed

    svc = host.service(sut)
    assert svc.is_running
    assert svc.is_enabled
