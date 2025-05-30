struct NestedRem {
    first: Int;
    sub: Sub;
}

struct Sub {
    rest: Slice as remaining;
}

contract NestedRems {
    v: NestedRem;

    init() {
        self.v = NestedRem{
            first: 1,
            sub: Sub{ rest: emptyCell().asSlice() },
        };
    }
}