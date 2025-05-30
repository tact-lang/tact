struct Inner {
    b: Bool;
}

struct Wrap {
    nestedOpt: Inner?;
}

contract NestedOptionalStruct {
    data: Wrap;

    init() {
        self.data = Wrap{ nestedOpt: null };
    }
}
