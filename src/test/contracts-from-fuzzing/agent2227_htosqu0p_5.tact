struct NestedOpt {
    foo: Int?;
}

struct NestedLayer {
    bar: Bool;
    nested: NestedOpt;
}

contract NestedContract {
    field: NestedLayer;

    init() {
        self.field = NestedLayer{ bar: false, nested: NestedOpt{ foo: null } };
    }
}