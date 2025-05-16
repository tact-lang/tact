struct ComplexNestedOpt {
    s1: String;
    nested: NestedOpt;
}

struct NestedOpt {
    n1: Int?;
    n2: Bool;
}

contract NestedOptionals {
    val: ComplexNestedOpt;

    init() {
        self.val = ComplexNestedOpt{
            s1: "test",
            nested: NestedOpt{
                n1: null,
                n2: true
            }
        };
    }
}
