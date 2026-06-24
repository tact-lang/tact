struct Foo {
    val: Int?;
}

struct Bar {
    foo: Foo = Foo{};
}

contract NestedDefaults {
    bar: Bar = Bar{};
}