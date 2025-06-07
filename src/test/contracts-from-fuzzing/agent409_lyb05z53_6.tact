struct NestedOne {
    inner: Int;
}

struct NestedTwo {
    inner1: NestedOne;
    inner2: NestedOne;
}

struct NestedThree {
    nested: NestedTwo;
    n: Int;
}

contract ContractNested {
    data: NestedThree;

    init() {
        self.data = NestedThree{
            nested: NestedTwo{
                inner1: NestedOne{ inner: 1 },
                inner2: NestedOne{ inner: 2 }
            },
            n: 42
        };
    }
}