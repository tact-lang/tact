message Payment {
    amount: Int;
    sender: Address;
}

contract Test {
    receive(msg: Payment) {
        let a = msg.amount;
        let s = msg.sender;
    }
}