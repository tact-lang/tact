struct Foo {
    a: Int as int8 = -5;
    b: Int as uint8 = 5;
    c: Bool = true;
    d: String = "x";
}

contract Test(
    foo: Foo
) {}