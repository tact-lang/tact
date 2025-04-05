message Payment {
    amount: Int;
}

contract Test {
    receive(msg: Payment) {
        let x = msg.amount;
    }
}