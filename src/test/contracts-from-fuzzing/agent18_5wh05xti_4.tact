struct A { a: Int; }

contract Test {
    receive() {
        let x: A = A{ a: 42 };
    }
}
