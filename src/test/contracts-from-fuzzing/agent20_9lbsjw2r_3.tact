trait TraitA {
    fun foo(): Int {
        return 1;
    }
    abstract fun bar(x: Int): Int;
    virtual fun baz(x: Int): Int {
        return x + 10;
    }
}

trait TraitB {
    fun foo(): Int {
        return 2;
    }
    abstract fun qux(y: Int): Int;
    virtual fun baz(x: Int): Int {
        return x * 2;
    }
}

contract TestContract(a: Int) with TraitA, TraitB {
    // 'a' becomes a persistent field accessible as self.a
    override fun foo(): Int {
        return 3;
    }

    override fun bar(x: Int): Int {
        return x - 1;
    }

    override fun qux(y: Int): Int {
        return y + 3;
    }

    // Resolving ambiguity for virtual function baz()
    override fun baz(x: Int): Int {
        // Combining implementations from TraitA and TraitB
        return (x + 10) + (x * 2);
    }

    receive() {
        let r1 = self.foo();      // expected: 3
        let r2 = self.bar(self.a);  // expected: self.a - 1
        let r3 = self.qux(self.a);  // expected: self.a + 3
        let r4 = self.baz(self.a);  // expected: (self.a + 10) + (self.a * 2)
        reply((r1 + r2 + r3 + r4).toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
