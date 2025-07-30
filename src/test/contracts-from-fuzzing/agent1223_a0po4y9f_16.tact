struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    baz: String;
    qux: A;
}

struct C {
    one: A;
    two: B;
    three: Bool;
}

contract MultiStructFields {
    data: C;
    init() {
        self.data = C{
            one: A{ foo: 1, bar: true },
            two: B{ baz: "hi", qux: A{ foo: 2, bar: false } },
            three: true
        };
    }
}