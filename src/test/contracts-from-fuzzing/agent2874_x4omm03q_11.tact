struct Foo {
    a: Int = 123;
    b: Bool = true;
}

contract TestContract {
    bar: Foo = Foo{};
}
