message EmptyMsg {}

contract Test {
    receive(msg: EmptyMsg) {
        let m = msg; // just use it
    }
}