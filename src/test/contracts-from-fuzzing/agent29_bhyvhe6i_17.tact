message M {
    a: Int;
}

contract Test {
    receive() {
        let m = M { a: 5 };
        m.a = 7;
    }
}