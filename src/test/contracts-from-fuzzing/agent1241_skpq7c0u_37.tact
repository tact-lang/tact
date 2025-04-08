struct OutRem {
    a: Int;
    r: Slice as remaining;
}

struct ContainRem {
    nested: OutRem;
    other: Int;
}

contract RemEnclosed {
    s: ContainRem;

    init() {
        self.s = ContainRem{
            nested: OutRem{
                a: 1,
                r: emptyCell().asSlice(),
            },
            other: 2,
        };
    }
}
