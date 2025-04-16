contract MinimalContract() {}

contract DeployTester() {
    receive() {
        deploy(DeployParameters{
            init: initOf MinimalContract(),
            value: ton("1")
        });
        cashback(sender());
    }
}
