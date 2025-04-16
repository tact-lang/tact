struct Foo {
    x: Int;
    y: Int = 5;
}

contract TestStorage {
    foo: Foo = Foo{
        x: 7
    };

    receive() {}
}