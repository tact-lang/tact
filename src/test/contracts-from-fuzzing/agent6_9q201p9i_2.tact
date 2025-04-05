contract TestAscii() {
    // Contract-level constant evaluated at compile-time using the ascii built-in function
    const ascii_val: Int = ascii("⚡");

    receive() {
        // Access the constant via self
        dump(self.ascii_val);
        cashback(sender());
    }
}
