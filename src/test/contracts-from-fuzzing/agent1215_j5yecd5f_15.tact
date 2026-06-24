struct A {
    foo: Int;
}

struct B {
    bar: Int;
    baz: A;
}

contract StructOverride {
    state: B;

    init() {
        self.state = B{
            bar: 7,
            baz: A{foo: 10}
        };
    }
}