contract DummyContract() {}

contract TestDeploy() {
    // This receiver tests the deploy() function by deploying a DummyContract
    receive() {
        // Call deploy() with a minimal set of parameters, using a valid initOf
        deploy(DeployParameters{
            init: initOf DummyContract(),
            value: ton("1")
        });
    }
}
