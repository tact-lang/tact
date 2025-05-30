contract ConstEvalTest() {
   // Constant evaluation using built-in compile-time functions
   const ascii_val: Int = ascii("⚡");          // expected: 14850721
   const ton_val: Int = ton("1");                 // expected: 1000000000
   const crc_val: Int = crc32("000DEADBEEF000");   // expected: 1821923098
   const sha_val: Int = sha256("constant_sha");     // computed at compile-time

   receive() {
       // Use constants in a computation to force evaluation in the compiled code
       let sum: Int = self.ascii_val + self.ton_val + self.crc_val + self.sha_val;
       // sum is not used further but this forces the constants to be evaluated
       cashback(sender());
   }
}
