struct S {
    a: Int;
    b: Int;
}

contract Test {
    receive() {
        let s = S{ a: 1, b: 2 };
    }
}