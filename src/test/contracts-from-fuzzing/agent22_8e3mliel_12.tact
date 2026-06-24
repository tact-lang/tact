struct Foo {
    bar: Int?;
}

contract Test {
    receive() {
        let f = Foo{ bar: null };
    }
}