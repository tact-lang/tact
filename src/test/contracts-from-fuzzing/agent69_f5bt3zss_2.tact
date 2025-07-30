message TestMsg {}

contract ValidReceiver {
    // Valid usage: wildcard used as receiver parameter to discard incoming message
    receive(_: TestMsg) {
    }
}
