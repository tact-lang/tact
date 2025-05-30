struct Inner1 {
    foo: Int;
}

struct Inner2 {
    bar: Inner1;
}

struct Inner3 {
    baz: Inner2;
}

contract TestStorage {
    nested: Inner3;

    init() {
        self.nested = Inner3{ baz: Inner2{ bar: Inner1{ foo: 999 } } };
    }
}