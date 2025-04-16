contract DummyContract() {}

contract TestDeploy() {
    // Minimal receiver that calls the deploy() function
    receive() {
        deploy(DeployParameters{
            init: initOf DummyContract(),
            value: ton("1")
        });
    }
}
