trait A {
    virtual fun greet(): String { return "A"; }
}

trait B with A {
    override fun greet(): String { return "B"; }
}

trait C with A {
    override fun greet(): String { return "C"; }
}

contract D() with B, C {
    // Resolving diamond conflict by overriding greet
    override fun greet(): String { return "B-C"; }

    receive() {
        dump(self.greet());
    }
}

contract Main() {
    receive() {
        // Minimal receiver
        cashback(sender());
    }
}
