contract ConstEval {
    // Contract-level constants must be accessed via `self` inside the contract
    const TON_ONE: Int = ton("1");
    const ASCII_LIGHTNING: Int = ascii("⚡");

    receive() {
         // Validate the constant values at runtime using require()
         require(self.TON_ONE == 1000000000, "ton(\"1\") did not evaluate to 1000000000");
         require(self.ASCII_LIGHTNING == 14850721, "ascii(\"⚡\") did not evaluate to 14850721");
         cashback(sender());
    }
}
