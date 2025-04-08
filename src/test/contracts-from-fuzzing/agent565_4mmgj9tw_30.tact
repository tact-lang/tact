struct BoolWrap {
    val: Bool;
}

contract BoolWrapTest {
    a: BoolWrap;
    b: BoolWrap?;
    init() {
        self.a = BoolWrap{ val:false };
        self.b = null;
    }
}