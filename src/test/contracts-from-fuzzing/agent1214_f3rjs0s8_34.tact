struct BoolWrap {
    flag: Bool;
}

contract WrappedBoolOpt {
    b1: BoolWrap;
    b2: BoolWrap;
    init() {
        self.b1 = BoolWrap{ flag: true };
        self.b2 = BoolWrap{ flag: false };
    }
}