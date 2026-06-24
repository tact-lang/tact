contract Dummy() {}

contract TestDeploy() {
    receive() {
        // Deploy a dummy contract using deploy()
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("0.001"),
            bounce: false,
            mode: SendRemainingValue
        });
        // Use cashback() to ensure the function is compiled
        cashback(sender());
    }
}
