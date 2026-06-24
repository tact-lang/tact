contract TestConstEval() {
    // This contract tests constant evaluation using built-in compile-time functions.
    // Expected: ton("1") returns 1000000000 nanoToncoins and ascii("⚡") returns 14850721.
    // Therefore, the constant 'val' should be 1000000000 + 14850721 = 1014850721.
    const val: Int = ton("1") + ascii("⚡");

    get fun value() : Int {
        return self.val;
    }
}
