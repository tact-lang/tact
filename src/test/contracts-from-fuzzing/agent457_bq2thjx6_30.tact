struct NestedWithRemaining {
    inner: Int as uint8;
    rest: Slice as remaining;
}

struct OuterRem {
    a: NestedWithRemaining;
}

contract Test {
    d: OuterRem;
    init() {
        self.d = OuterRem{
            a: NestedWithRemaining{
                inner: 5,
                rest: emptyCell().asSlice()
            }
        };
    }
}