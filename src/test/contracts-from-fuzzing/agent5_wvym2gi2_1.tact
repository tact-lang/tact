contract DeployedContract() {}

contract Deployer() {
    receive() {
        deploy(DeployParameters{
            init: initOf DeployedContract(),
            value: ton("1")
        });
    }
}
