struct One {
    foo: Int;
}
struct Two {
    bar: Int;
}
struct Three {
    baz: Int;
}

contract MultiNested {
    a: One;
    b: Two;
    c: Three;

    init() {
        self.a = One{ foo: 1 };
        self.b = Two{ bar: 2 };
        self.c = Three{ baz: 3 };
    }
}