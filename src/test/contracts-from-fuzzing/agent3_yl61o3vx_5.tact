contract ConstSha256 {
    // Compute SHA256 for the string "test" at compile-time
    // The expected result is: 0x9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08
    const SHA256_RESULT: Int = sha256("test");

    receive() {
         require(self.SHA256_RESULT == 0x9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08,
                 "sha256(\"test\") did not match the expected value");
         cashback(sender());
    }
}
