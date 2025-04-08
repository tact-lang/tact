struct Foo {
    a: Int;
}

struct Bar {
    b: Foo;
}

contract OptionalStructNullInit {
    data: Bar?;
    init() {
        self.data = null;
    }
}
