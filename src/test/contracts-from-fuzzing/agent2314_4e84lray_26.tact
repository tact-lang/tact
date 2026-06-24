struct InnerRem {
    num: Int;
    rest: Slice as remaining;
}

struct OuterRem {
    prefix: Int;
    data: InnerRem;
}

contract TestNestedRemaining {
    f: OuterRem;
    init() {
        self.f = OuterRem{
            prefix: 888,
            data: InnerRem{
                num: 42,
                rest: emptyCell().asSlice()
            }
        };
    }
}