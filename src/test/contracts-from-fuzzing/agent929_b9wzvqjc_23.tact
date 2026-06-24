struct NestedOptOpt {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    a: NestedOptOpt?;
    b: NestedOptOpt?;
}

contract NestedOptionals {
    c: Container;
    init() {
        self.c = Container{ a: null, b: null };
    }
}