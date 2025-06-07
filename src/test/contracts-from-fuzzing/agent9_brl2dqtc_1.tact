contract Target() {}

contract TesterDeploy() {
    receive() {
        // Test deploy() function: deploys Target contract with 1 Toncoin attached
        deploy(DeployParameters{
            init: initOf Target(),
            value: ton("1")
        });
        // Use cashback() to handle remaining balance
        cashback(sender());
    }
}
