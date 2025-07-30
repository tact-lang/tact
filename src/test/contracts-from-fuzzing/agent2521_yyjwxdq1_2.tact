struct Inner {
    foo: Int = 123;
    bar: Bool = true;
}

struct Outer {
    id: Int = 7;
    nested: Inner?;
}

contract Test {
    state: Outer = Outer{ id: 9, nested: null };

    init() {}
}
