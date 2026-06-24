struct Foo {
    bar: Int;
}

contract OptionalUnset {
    item: Foo?;  // optional of Foo, no explicit default initialized

    // no init()
}