struct NestedOptionalDefault {
    foo: Foo? = null;
}

struct Foo {
    bar: Bar;
}

struct Bar {
    x: Int;
}

contract OptDef {
    state: NestedOptionalDefault;
    init() {
        self.state = NestedOptionalDefault{};
    }
}