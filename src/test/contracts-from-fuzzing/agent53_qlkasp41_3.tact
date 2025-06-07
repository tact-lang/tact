contract TestAscii() {
    // Contract-level constant must be accessed via self, per documentation
    const TEST_ASCII: Int = ascii("⚡");

    get fun getAscii() : Int {
         return self.TEST_ASCII;
    }
}
