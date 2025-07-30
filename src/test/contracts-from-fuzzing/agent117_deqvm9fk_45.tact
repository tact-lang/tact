// optional struct with defaulted fields
struct Foo {
    a: Int = 1;
    b: Bool = true;
}

contract OptWithDefaults {
    foo: Foo?;

    init() {
        self.foo = Foo{a:42,b:false};
    }
}
