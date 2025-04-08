struct Foo {
    a: Int;
    b: Bool;
}

contract FooHolder {
    fooVar: Foo = Foo{ a: 5, b: true };
}