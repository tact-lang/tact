contract TestConstEval {
    // Contract-level constants computed at compile-time using built-in functions
    const T_Ton: Int = ton("1");          // Expected to evaluate to 1000000000
    const T_Ascii: Int = ascii("⚡");      // Expected to evaluate to 14850721

    receive() {
        // Use self to refer to contract-level constants
        require(self.T_Ton == 1000000000, "ton evaluation incorrect");
        require(self.T_Ascii == 14850721, "ascii evaluation incorrect");
    }
}
