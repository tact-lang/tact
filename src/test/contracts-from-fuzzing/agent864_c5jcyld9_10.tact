struct Mess {
    body: String;
}

message(1001) MyMsg {
    content: String;
}

contract TestContract {
    note: Mess;
    msgHolder: MyMsg;

    init() {
        self.note = Mess{ body: "hi" };
        self.msgHolder = MyMsg{ content: "hey" };
    }
}