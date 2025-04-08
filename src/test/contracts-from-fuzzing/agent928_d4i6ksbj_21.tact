struct Foo {
    x: Int?;
    y: Bool?;
}

struct Bar {
    foo: Foo?;
    s: String?;
}

contract DeepOptional {
    data: Bar?;

    init() {
        self.data = null;
    }
}