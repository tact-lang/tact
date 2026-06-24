struct A {
    foo: Int;
}

struct B {
    bar: Int;
    nested: A;
}

contract InitOptionalFields {
    f: B?;

    init() {
        self.f = null;
    }
}