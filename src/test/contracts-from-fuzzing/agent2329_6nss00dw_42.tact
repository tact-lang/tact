struct IntWrap {
    w: Int;
}

contract WrapTest {
    fw: IntWrap;
    sw: IntWrap;

    init() {
        self.fw = IntWrap{ w:1 };
        self.sw = IntWrap{ w:2 };
    }
}
