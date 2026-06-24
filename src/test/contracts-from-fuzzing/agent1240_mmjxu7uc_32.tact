contract SingleMsg {
    data: MyMsg;

    init() {
        self.data = MyMsg{
            num: 2024
        };
    }
}

message(55) MyMsg {
    num: Int;
}
