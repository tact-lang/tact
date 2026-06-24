struct NestedRem1 {
    num: Int;
    tail: Slice as remaining;
}

struct NestedRem2 {
    nested: NestedRem1;
    extra: Int;
}

contract NestedRemaining {
    data: NestedRem2;

    init() {
        self.data = NestedRem2{
            nested: NestedRem1{
                num: 10,
                tail: emptyCell().asSlice()
            },
            extra: 20
        };
    }
}