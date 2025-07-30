struct Foo {
    bar: Int;
}

contract Test {
    receive() {
        let a = Foo{ bar: 10 };
    }
}