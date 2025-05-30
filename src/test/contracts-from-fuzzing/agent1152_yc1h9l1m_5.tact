struct NestedOptional {
    foo: Inner?;
}

struct Inner {
    bar: Int?;
}

contract Test {
    rec: NestedOptional;

    init() {
        self.rec = NestedOptional{
            foo: Inner{ bar: 42 }
        };
    }
}