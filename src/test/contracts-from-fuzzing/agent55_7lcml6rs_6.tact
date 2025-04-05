message SimpleMessage {
    amount: Int;
}

contract TestContract {
    receive(msg: SimpleMessage) {
        let a = msg.amount;
    }
}