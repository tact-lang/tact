struct NestedOptional {
    inner: Bool?;
}

struct Higher {
    nested: NestedOptional?;
}

contract Test {
    data: Higher;
    init() {
        self.data = Higher{
            nested: NestedOptional{
                inner: true
            }
        };
    }
}