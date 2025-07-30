message M {}

contract Test {
    receive(msg: M) {
        return;
    }
}
