struct Foo {
    a: Int;
    b: Bool;
}

contract DefaultAtField {
    myVal: Foo = Foo{ a: 5, b: true };

    receive() {}
}