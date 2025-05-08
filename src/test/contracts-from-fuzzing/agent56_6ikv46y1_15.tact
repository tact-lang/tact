struct Pair { a: Int; b: Int; c: Int }

contract Test {
    receive() {
        // Test: Multiple wildcards in destructuring assignment for a struct
        let Pair { a, b: _, c: _ } = Pair { a: 1, b: 2, c: 3 };
        dump(a); // Expected output: 1
    }
}
