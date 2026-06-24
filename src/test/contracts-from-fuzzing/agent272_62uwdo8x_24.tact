struct InnerRem {
    s1: Slice as remaining;
}

struct OuterRem {
    prefix: Int;
    nested: InnerRem;
    suffix: Slice as remaining;
}

contract TestMultiNestedRemaining {
    data: OuterRem;

    init() {
        self.data = OuterRem{
            prefix: 7,
            nested: InnerRem{ s1: emptyCell().asSlice() },
            suffix: emptyCell().asSlice()
        };
    }
}