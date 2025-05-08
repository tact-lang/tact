contract Test {
    const PI: Int = 314;  // constant declared inside contract

    // Persistent state variable using the constant in an arithmetic expression
    a: Int = self.PI - 14; // Expected to be 300

    receive() {}
}
