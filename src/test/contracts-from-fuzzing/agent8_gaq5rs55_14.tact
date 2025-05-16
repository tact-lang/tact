contract ExprSubtractionAssociativity {
    fun test() {
        // Subtraction is left-associative: (1 - 2) - 3 = -4
        let a = 1 - 2 - 3;
        dump(a); // expected output: -4
    }

    receive() {
        self.test();
    }
}
