contract TestCompileTimeFunctions {
    // This function tests compile-time evaluation of functions like sha256 and ton
    fun test_compile(): Int {
        // sha256 returns an Int computed at compile-time for given string
        let hash = sha256("hello world");
        // ton("1") returns 1 Toncoin in nanoToncoins, expected: 1000000000
        let ton_value = ton("1");
        // Return the sum of both values
        return hash + ton_value;
    }

    receive() {
        dump(self.test_compile());
    }
}
