// Compose persistence contract using message struct fields
message(42) MyMsg {
    important: Int;
}

contract TestContract {
    lastMsg: MyMsg;

    init() {
        self.lastMsg = MyMsg{ important: 99 };
    }
}