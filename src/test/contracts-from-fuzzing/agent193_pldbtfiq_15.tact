struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

contract MultiLayers {
    data: C;

    init() {
        self.data = C{baz: B{bar: A{foo: 123}}};
    }
}