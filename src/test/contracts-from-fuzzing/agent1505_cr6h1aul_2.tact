struct NestedOptional {
    foo: Int?;
}

struct OuterStruct {
    nested: NestedOptional?;
}

contract Test {
    s: OuterStruct;
    init() {
        self.s = OuterStruct{ nested: null };
    }
}