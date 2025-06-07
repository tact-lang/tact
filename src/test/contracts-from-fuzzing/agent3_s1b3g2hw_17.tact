message Data {
    x: Int;
}

contract Test {
    receive(msg: Data) {
        msg.x = 42;
    }

    receive() {
        let d = Data{x: 1};
        d.x = 99;
    }
}