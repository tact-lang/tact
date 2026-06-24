struct NestedRem {
    s: MidRem;
}

struct MidRem {
    prefix: Int;
    rest: Slice as remaining;
}

contract TestContract {
    data: NestedRem;

    init() {
        self.data = NestedRem{
            s: MidRem{
                prefix: 42,
                rest: emptyCell().asSlice(),
            }
        };
    }
}