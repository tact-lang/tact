struct NestedOpt1 {
    foo: Int?;
}

struct NestedOpt2 {
    bar: NestedOpt1?;
}

contract OptDeep {
    val: NestedOpt2;
    init() {
        self.val = NestedOpt2{ bar: NestedOpt1{ foo: null } };
    }
}