message MyMessage {
    amount: Int;
}

contract Test {
    receive(msg: MyMessage) {
        let x = msg.amount;
        msg.amount = 10;
    }
}