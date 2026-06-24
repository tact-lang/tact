struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct ContainsNestedOpt {
    inner: NestedOpt?;
}

contract NestedOptionals {
    field: ContainsNestedOpt;

    init() {
        self.field = ContainsNestedOpt{
            inner: NestedOpt{a: 5, b: null}
        };
    }
}