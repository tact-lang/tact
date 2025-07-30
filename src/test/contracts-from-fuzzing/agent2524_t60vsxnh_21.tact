struct Foo {
    val: Int;
}

struct Bar {
    val: Bool;
    foo: Foo;
}

contract NameClash {
    store: Bar = Bar{
        val: false,
        foo: Foo{ val: 42 }
    };
}