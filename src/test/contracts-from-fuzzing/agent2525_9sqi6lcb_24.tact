// Multiple nested structs as persistent fields

struct Foo {
    a: Int;
    b: String;
}

struct Bar {
    f: Foo;
    c: Bool;
}

struct Baz {
    d: String;
    e: Bar;
}

contract TestContract {
    baz: Baz;

    init() {
        self.baz = Baz{
            d: "hi",
            e: Bar{
                f: Foo{a: 1, b: "x"},
                c: true
            }
        };
    }
}