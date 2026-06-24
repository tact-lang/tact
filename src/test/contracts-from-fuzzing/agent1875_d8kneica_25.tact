message(12345) MyMsg {
    val: Int;
}

contract FuzzOptMsgField {
    data: MyMsg?;
    init() {
        self.data = null;
    }
}
