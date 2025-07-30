struct Pair { a: Int; b: Int }

contract Test {
    receive() {
        let p: Pair = Pair { a: 5, b: 10 };
        // Valid destructuring assignment: providing both fields
        let Pair { a, b } = p;
        dump(a);
        dump(b);
    }
}
