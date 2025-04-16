trait Base {
    // Virtual function with default implementation
    virtual fun f(x: Int): Int {
        return x + 1;
    }

    // Virtual constant with default value
    virtual const X: Int = 10;
}

// First level trait, does not override anything
trait L1 with Base {}

// Second level trait, overrides both function and constant
trait L2 with Base {
    override fun f(x: Int): Int {
        return x * 2;
    }

    override const X: Int = 20;
}

// Diamond pattern: Inheriting both L1 and L2
// According to Tact's rules, the contract must resolve conflicts explicitly using override
contract Diamond() with L1, L2 {
    // Override the conflicting function
    override fun f(x: Int): Int {
        // Chosen resolution: use addition with self.X
        return x + self.X;
    }

    // Override the constant to resolve diamond conflict
    override const X: Int = 30;

    // Getter function to test behavior
    get fun test(): Int {
        // Expected result: f(5) = 5 + self.X = 5 + 30 = 35
        return self.f(5);
    }
}
