contract TestDeploy() {
    receive() {
        // Using deploy() with initOf without parentheses around the contract name
        deploy(DeployParameters{
            init: initOf TestContract(),
            value: ton("1")
        });
    }
}

contract TestContract() {}