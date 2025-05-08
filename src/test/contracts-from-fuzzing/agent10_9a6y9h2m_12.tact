contract ConstTon {
    // Constant computed using a compile-time function
    const ONE: Int = ton("1");

    receive() {
         // Use the compile-time function ton and the constant
         let diff: Int = ton("1") - self.ONE; // expected 0
         diff;
    }
}
