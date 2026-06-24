struct Foo {
    a: Int?;
    b: String;
}

struct Bar {
    f: Foo?;
    c: Bool;
}

contract OptionalNestedStruct {
    data: Bar;

    init() {
        self.data = Bar{
            f: null,
            c: true
        };
    }
}