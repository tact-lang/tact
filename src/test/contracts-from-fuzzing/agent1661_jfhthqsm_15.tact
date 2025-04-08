message(1234) MyMsg {
    value: Int;
}

contract MessageField {
    m: MyMsg? = null;

    init() {
        self.m = MyMsg{value: 7};
    }
}