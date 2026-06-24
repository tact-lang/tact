struct Leaf {
    data: Slice as remaining;
}

struct Branch {
    leaf: Leaf;
}

contract NestedRemain2 {
    b: Branch;

    init() {
        self.b = Branch{ leaf: Leaf{ data: emptyCell().asSlice() } };
    }
}