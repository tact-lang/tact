trait Base {
    // Virtual function with default implementation
    virtual fun f(): Int { return 1; }
    // Virtual constant with default value
    virtual const K: Int = 10;
}

trait T1 with Base {
    override fun f(): Int { return 2; }
    override const K: Int = 20;
}

trait T2 with Base {
    override fun f(): Int { return 3; }
    // Not overriding K, so it remains as defined in Base (10) unless resolved
}

// In a diamond inheritance, Diamond inherits from T1 and T2 which both have Base as common ancestor.
// A conflict arises because T1 and T2 have differing implementations of f() (and K is ambiguous).
// The contract resolves the conflict by providing its own override.
contract Diamond() with T1, T2 {
    // Explicitly overriding f() to resolve the conflict
    override fun f(): Int {
         return 4;
    }
    // Also overriding constant K
    override const K: Int = 40;

    receive() {
         dump(self.f());   // Expected output: 4
         dump(self.K);     // Expected output: 40
         // Standard practice: return any remaining funds.
         cashback(sender());
    }
}
