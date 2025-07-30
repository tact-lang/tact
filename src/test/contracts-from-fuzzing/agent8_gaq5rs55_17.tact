contract ExprComplexCombination {
    fun test() {
        // Complex expression mixing arithmetic, bitwise, and grouping
        // Compute: ((-5 + 2) * (3 - (~2))) / (1 + (4 % 3))
        // Evaluation:
        //   -5 + 2 = -3
        //   ~2, bitwise NOT of 2, equals -3
        //   3 - (-3) = 6
        //   (4 % 3) = 1, so denominator becomes 1 + 1 = 2
        //   Then, (-3 * 6) / 2 = -18/2 = -9
        let result = ((-5 + 2) * (3 - (~2))) / (1 + (4 % 3));
        dump(result); // expected output: -9
    }
    
    receive() {
        self.test();
    }
}
