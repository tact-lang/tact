contract Dummy() {}

contract TestDeploy() {
    receive() {
        // Test deploy() with a minimal dummy contract
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }
}
