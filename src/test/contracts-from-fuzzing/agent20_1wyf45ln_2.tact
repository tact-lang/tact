contract Dummy {}

contract DeployTest {
    fun testDeploy() {
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }

    receive() {
        self.testDeploy();
        cashback(sender());
    }
}
