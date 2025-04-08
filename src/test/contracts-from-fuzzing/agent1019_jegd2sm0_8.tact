struct Foo {
    bar: Int = 37;
    baz: Bool;
}

contract TestContract {
    foo: Foo = Foo{baz: true};

    init() {} 
}