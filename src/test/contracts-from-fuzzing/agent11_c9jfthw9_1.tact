contract Dummy() {}

contract TestDeploy() {
    receive() {
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }
}
