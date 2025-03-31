contract Test {
    a: Int = 42;

    receive() {}

    // Test: Accessing field using self
    fun testAccess(): Int {
        return self.a;
    }

    // Test: Modifying field using self
    fun testModify(): Int {
        self.a = 100;
        return self.a;
    }

    // Test: Using a local variable that shadows state variable name
    fun testShadow(): Int {
        let a = 10;
        return a + self.a;
    }
}
