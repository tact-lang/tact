// Test same struct used twice with different default values
struct Foo {
    x: Int = 7;
}

struct Bar {
    foo1: Foo = Foo{};
    foo2: Foo = Foo{x: 42};
}

contract ReusedStructDefaults {
    bar: Bar;

    init() {
        self.bar = Bar{};
    }
}
