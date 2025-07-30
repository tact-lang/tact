contract TestDeploy2 {
    receive() {
        // Test deploy() with minimal parameters as per documentation: only init and value are expected in DeployParameters
        deploy(DeployParameters{
            init: initOf Demo(),
            value: ton("0.5")
        });
    }
}

contract Demo() {}