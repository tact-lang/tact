struct Foo {
    a: Int;
    b: Bool;
}

contract Test {
    f: Foo = Foo{ a: 1, b: true };
    init() {}
}