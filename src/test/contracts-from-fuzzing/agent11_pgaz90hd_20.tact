contract TestConstantsArithmetic() {
    // Testing arithmetic on compile-time constants using ton
    // ton("0.1") gives 100000000 and ton("0.5") gives 500000000
    // Expected NEG_DIFF = 100000000 - 500000000 = -400000000
    const NEG_DIFF: Int = ton("0.1") - ton("0.5");
    // Also test mixed arithmetic with ascii
    // ascii("a") = 97, so EXPECTED_SUM = 97 +  ton("0.000000001")
    // ton("0.000000001") = 1, so EXPECTED_SUM = 98
    const MIXED_SUM: Int = ascii("a") + ton("0.000000001");
    
    receive() {
        dump(self.NEG_DIFF);    // Expected output: -400000000
        dump(self.MIXED_SUM);   // Expected output: 98
    }
}
