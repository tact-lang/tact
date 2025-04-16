message(42) MyMsg {
    v: Int = 1;
    b: Bool = true;
}

contract TestOptionalMsgStorage {
    m: MyMsg? = null;

    init() {
        self.m = MyMsg{ v: 5, b: false };
    }
}