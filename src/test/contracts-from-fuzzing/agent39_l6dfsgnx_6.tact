message EmptyMsg {}

contract Test {
    receive(message: EmptyMsg) {
        // do nothing
    }
}