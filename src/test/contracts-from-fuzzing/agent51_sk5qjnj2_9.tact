struct Two {
    a: Int;
    b: Int;
}

contract TestDiscardDestructuring {
    receive() {
        // Discard the second field using underscore
        let Two { a, b: _ } = Two { a: 100, b: 200 };
        dump(a);
    }
}
