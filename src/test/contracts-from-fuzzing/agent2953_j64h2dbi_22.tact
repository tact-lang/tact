struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    foo: Foo;
    s: String;
    opt: Int?;
}

contract MixedNestedOptions {
    data: Bar;

    init() {
        self.data = Bar{
            foo: Foo{
                a: 9,
                b: true
            },
            s: "okay",
            opt: null
        };
    }
}