struct Foo {
    a: Int = 5;
    b: Bool = false;
}

struct Bar {
    f: Foo? = null;
    c: Bool = true;
}

contract NestedDefaultsOpt {
    data: Bar;
    init() {
        self.data = Bar{};
    }
}