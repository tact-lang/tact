struct Foo {
    x: Int;
}

contract ConstStruct {
    s: Foo = Foo{ x: 1 };
    init() {}
}