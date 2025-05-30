contract Dummy() {}

contract TestDeploy() {
    receive() {
        // Testing deploy() with minimal DeployParameters
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("0.1")
        });
    }
}
