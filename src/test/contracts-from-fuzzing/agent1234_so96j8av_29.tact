struct Leaf {
    foo: Slice as remaining;
}

struct Branch {
    bar: Int;
    leaf: Leaf;
}

contract NestedRemaining {
    data: Branch;

    init() {
        self.data = Branch{
            bar: 123,
            leaf: Leaf{ foo: emptyCell().asSlice() },
        };
    }
}