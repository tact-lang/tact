struct NoTailSub {
    x: Int;
    y: Int;
}

struct OptionalMiddle {
    one: Int;
    mid: NoTailSub?;
    two: Int;
}

contract OptionMidContract {
    data: OptionalMiddle;

    init() {
        self.data = OptionalMiddle{one:1, mid:null, two:2};
    }
}