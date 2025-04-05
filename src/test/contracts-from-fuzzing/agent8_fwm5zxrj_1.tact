contract TesterDeploy {
    receive() {
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
        cashback(sender());
    }
}

contract Dummy() {}