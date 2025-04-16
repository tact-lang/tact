struct Foo {
    bar: Int;
    baz: String;
}

contract TestContract {
    x: Foo = Foo{ bar: 42, baz: "one" };
    y: Foo = Foo{ bar: 7, baz: "two" };
    init() {}
}