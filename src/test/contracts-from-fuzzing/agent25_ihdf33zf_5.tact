contract TestCombinedEvaluation() {
    // Combine compile-time evaluations: ton("1") should be 1000000000, ascii("⚡") should be 14850721
    // Sum expected: 1000000000 + 14850721 = 1014850721
    const SUM: Int = ton("1") + ascii("⚡");

    receive() {
        dump(self.SUM.toString());
    }
}
