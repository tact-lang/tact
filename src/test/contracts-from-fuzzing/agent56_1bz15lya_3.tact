trait T1 {
    // Abstract constant, must be overridden
    abstract const c1: Int;

    // Function using the abstract constant c1
    fun f1(): Int {
        return self.c1 * 2;
    }
}

trait T2 {
    // Virtual constant with default value
    virtual const c2: Int = 5;

    // Function using the virtual constant c2
    fun f2(): Int {
        return self.c2 + 1;
    }
}

contract C() with T1, T2 {
    // Override required abstract constant
    override const c1: Int = 10;
    // Override the virtual constant
    override const c2: Int = 7;

    // Getter function that combines outputs of trait functions
    get fun test(): Int {
        // Expected: f1() = 10*2 = 20, f2() = 7+1 = 8; total 28
        return self.f1() + self.f2();
    }
}
