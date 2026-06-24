contract SomeContract() {}

contract TestDeploy() {
    receive() {
        // Deploy a new instance of SomeContract with 1 Toncoin attached
        deploy(DeployParameters{
            init: initOf SomeContract(),
            mode: SendIgnoreErrors,
            value: ton("1"),
            body: null
        });
        // Forward remaining value back to sender
        cashback(sender());
    }
}
