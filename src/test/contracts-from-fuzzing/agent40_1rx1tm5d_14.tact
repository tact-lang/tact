struct Pair {
    a: Int;
    b: Bool;
}

contract TestDestructuring {
    receive() {
        // Destructuring assignment: unpack the Pair struct
        let Pair { a, b } = Pair { a: 100, b: false };
        dump(a); // expected output: 100
        dump(b); // expected output: false
    }
}
