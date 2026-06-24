contract Dummy {}

contract DeployTest {
    receive() {
        deploy(DeployParameters{
            init: initOf Dummy(),
            value: ton("1")
        });
    }
}
