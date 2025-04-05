message ComplexMessage {
    amount: Int;
    sender: Address;
    flag: Bool;
}

contract TestContract {
    receive(msg: ComplexMessage) {
        let a = msg.amount;
        let s = msg.sender;
        let f = msg.flag;
    }
}