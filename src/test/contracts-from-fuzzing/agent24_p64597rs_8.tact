message Msg {
    data: Int;
}

contract Test {
    receive() {
        let m: Msg = Msg { data: 5 };
    }
}