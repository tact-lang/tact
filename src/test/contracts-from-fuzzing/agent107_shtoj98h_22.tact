struct NestedDefaults {
    a: Int = 5;
    b: Foo;
}

struct Foo {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{ b: Foo{} };
    }
}
