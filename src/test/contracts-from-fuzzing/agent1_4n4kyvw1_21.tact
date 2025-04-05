message Input {
    x: Int;
}

contract Test {
    receive(msg: Input) {
        let copy = msg;
    }
}