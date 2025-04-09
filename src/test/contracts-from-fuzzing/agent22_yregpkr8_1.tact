contract TestDeploy() {
    // Receiver uses deploy() to deploy Dummy contract
    receive() {
        // Deploy Dummy contract with 1 Toncoin attached
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }
}

// Minimal dummy contract to be deployed
contract Dummy() {}