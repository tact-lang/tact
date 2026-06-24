struct Pair { a: Int; b: Int }

contract TestDestructuring {
    receive() {
        let p: Pair = Pair { a: 1, b: 2 };
        let Pair { a, b } = p;
        dump(a + b); // Expected output: 3
    }
}
