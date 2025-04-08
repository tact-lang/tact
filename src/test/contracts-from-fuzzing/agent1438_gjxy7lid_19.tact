struct Bar {
    msg: String = "default";
}

struct Foo {
    nested: Bar? = null;
}

contract OptionalNestedWithDefault {
    data: Foo = Foo{};
}