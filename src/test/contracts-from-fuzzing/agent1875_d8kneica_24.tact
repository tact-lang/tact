message(12345) MyMsg {
    val: Int;
}

contract FuzzMsgField {
    data: MyMsg;
    init() {
        self.data = MyMsg { val: 42 };
    }
}
