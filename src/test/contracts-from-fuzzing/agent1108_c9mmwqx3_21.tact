message(123) MyMessage {
    amount: Int;
    status: Bool;
}

contract TestContract {
    msgData: MyMessage;

    init() {
        self.msgData = MyMessage{ amount: 1000, status: true };
    }
}