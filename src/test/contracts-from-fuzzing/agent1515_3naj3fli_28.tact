struct A {
    foo: Int;
}

struct B {
    bar: A;
}

contract OptionalOfOptionalStruct {
    nested: B?;

    init() {
        self.nested = null;
    }
}