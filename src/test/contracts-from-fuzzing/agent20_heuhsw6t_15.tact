struct Pair { a: Int; b: Int; }

contract TestDestructuringAssignment {
    fun showcase() {
        // Instantiation of a struct 'Pair' and using destructuring assignment with a wildcard.
        let p = Pair{ a: 10, b: 20 };
        // Destructuring assignment: binding field 'a' to variable 'x', ignoring field 'b'
        let Pair { a: x, .. } = p;
        dump(x); // expected output: 10

        // Destructuring assignment with renaming both fields
        let Pair { a: first, b: second } = p;
        dump(first);   // expected output: 10
        dump(second);  // expected output: 20
    }

    receive() {
        self.showcase();
    }
}
