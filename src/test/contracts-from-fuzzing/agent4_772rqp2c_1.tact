contract Dummy() {}

contract TestDeploy() {
    // This receiver uses deploy() to deploy a Dummy contract
    receive() {
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }
}
