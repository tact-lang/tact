contract MyContract() {}

fun testDeploy() {
    deploy(DeployParameters{
       init: initOf MyContract(),
       value: ton("1")
    });
}

// Dummy receiver to ensure testDeploy is compiled
contract Dummy {
    receive() {
        testDeploy();
        cashback(sender());
    }
}
