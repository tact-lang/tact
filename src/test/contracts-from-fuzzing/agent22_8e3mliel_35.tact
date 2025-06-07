struct Bar {
    baz: Int;
}

contract Test {
    receive() {
        let b = Bar{baz: 2};
        b.baz += 3;
    }
}