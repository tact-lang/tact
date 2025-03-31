message DummyMsg {}

contract TestValidReceiver {
    receive(_: DummyMsg) {
    }
}
