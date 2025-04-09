struct Middle {
    val: Int;
}

contract OptionalInMiddle {
    mid: Middle? = null;
    someFlag: Bool = false;

    init() {
        self.mid = null;
        self.someFlag = true;
    }
}