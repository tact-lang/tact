struct A {
    foo: Int?;
}

struct B {
    bar: Int;
    baz: A?;
}

struct C {
    bat: String;
    qux: B?;
}

contract ComplexOption {
    val: C;

    init() {
        self.val = C{
            bat: "ok",
            qux: null,
        };
    }
}