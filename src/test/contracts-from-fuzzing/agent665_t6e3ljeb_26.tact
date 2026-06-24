struct NestedRem {
    outerPrefix: Int as uint8;
    inner: InnerRem;
}

struct InnerRem {
    prefix2: Int as uint8;
    tail: Slice as remaining;
}

contract TestNestedRem {
    data: NestedRem;

    init() {
        self.data = NestedRem{
            outerPrefix: 1,
            inner: InnerRem{
                prefix2:2,
                tail: emptyCell().asSlice()
            }
        };
    }
}
