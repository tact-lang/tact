struct Msg {
    data: Int;
}

contract Test {
    receive() {
        let m = Msg { data: 1 };
        m.data = 10;
    }
}