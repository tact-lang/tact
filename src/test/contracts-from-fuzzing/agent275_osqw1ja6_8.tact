struct Foo {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Bar {
    foo: Foo?;
    val: Int;
}

contract TestContract {
    bar: Bar;

    init() {
        self.bar = Bar{
            foo: null,
            val: 123,
        };
    }
}