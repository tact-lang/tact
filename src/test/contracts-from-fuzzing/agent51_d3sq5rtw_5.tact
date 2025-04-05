message M {
    amount: Int;
}

contract Test {
    receive(msg: M) {
        // message param
    }
}