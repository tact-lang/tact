struct OptNested {
    foo: Inner?;
}

struct Inner {
    bar: Int?;
}

contract Test {
    data: OptNested;

    init() {
        self.data = OptNested{ foo: Inner{ bar: null } };
    }
}
