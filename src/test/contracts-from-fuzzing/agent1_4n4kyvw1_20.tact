message Recv {
    data: Int;
}

contract Test {
    receive(msg: Recv) {
        let x = msg.data;
    }
    receive() {
        let y = 2;
    }
}