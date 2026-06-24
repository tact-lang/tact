message M {
    n: Int;
}

contract Test {
    receive(msg: M) {
        let a = msg.n;
    }

    receive() {
        let b = M{ n: 5 };
    }
}