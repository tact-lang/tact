message M {
    amount: Int;
}

contract Test {
    receive(msg: M) {
        let x = msg.amount;
    }
}