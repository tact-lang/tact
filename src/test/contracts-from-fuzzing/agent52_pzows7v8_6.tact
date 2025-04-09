contract TestConstArithmetic {
    // Valid constant computed at compile-time using arithmetic and a compile-time function
    const Computed: Int = 100 * 2 + ascii("ABC");

    receive() {
         // Use the constant in a receiver
         let x: Int = self.Computed;
    }
}
