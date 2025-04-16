struct Three { a: Int; b: Int; c: Int }

contract TestDestructuring {
    receive() {
        // Destructure the Three struct and dump the individual values
        let Three { a, b, c } = Three { a: 10, b: 20, c: 30 };
        dump(a);
        dump(b);
        dump(c);
    }
}
