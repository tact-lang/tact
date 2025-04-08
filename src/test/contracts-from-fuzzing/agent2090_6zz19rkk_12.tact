message(0xabc) MyMsg {
    foo: Int;
    bar: String?;
}

contract MsgOptPersist {
    val: MyMsg?;

    init() {
        self.val = null;
    }
}