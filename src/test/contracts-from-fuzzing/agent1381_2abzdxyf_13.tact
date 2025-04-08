struct NestedRemain {
    a: Int;
    b: InnerRemain;
}

struct InnerRemain {
    s: Slice as remaining;
}

contract TestContract {
    field: NestedRemain;

    init() {
        self.field = NestedRemain{
            a: 1,
            b: InnerRemain{
                s: emptyCell().asSlice()
            }
        };
    }
}