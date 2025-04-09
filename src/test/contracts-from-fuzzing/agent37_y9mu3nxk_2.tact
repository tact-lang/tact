struct S {
    a: Int
}

contract Test {
    receive() {
        let s = S{ a: 1 };
        s;
    }
}