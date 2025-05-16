trait T1 {
    virtual fun foo(): Int { return 1; }
}

trait T2 {
    virtual fun foo(): Int { return 2; }
}

contract C() with T1, T2 {
    // Overriding to resolve ambiguous method
    override fun foo(): Int { return 3; }

    receive() {
        // Use self.foo() to call the overridden method
        let a = self.foo();
        dump(a);
    }
}

contract Main() {
    receive() {
        // Minimal receiver
        cashback(sender());
    }
}
