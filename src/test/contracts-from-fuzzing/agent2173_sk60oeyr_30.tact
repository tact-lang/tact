struct NestedOptDefaults {
    a: Int? = 1;
    b: Int? = null;
}

struct ContainsNestedOpt {
    nested: NestedOptDefaults;
    x: Int;
}

contract NestedOptDefaultTest {
    f: ContainsNestedOpt;

    init() {
        self.f = ContainsNestedOpt{
            nested: NestedOptDefaults{},
            x: 42
        };
    }
}