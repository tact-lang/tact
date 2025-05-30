struct Foo {
    bar: Int;
}

contract Test {
    receive() {
        let foo = Foo{ bar: 1 };
        foo.bar = 5;
    }
}