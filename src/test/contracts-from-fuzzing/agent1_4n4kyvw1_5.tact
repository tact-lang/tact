message Msg {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let m = Msg{a: 5, b: false};
    }
}