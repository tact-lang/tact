struct Limits {
    val: Int as uint8;
}

contract NestedRangeCheck {
    opt: Limits?;
    init() {
        self.opt = Limits{ val: -1 };
    }
}