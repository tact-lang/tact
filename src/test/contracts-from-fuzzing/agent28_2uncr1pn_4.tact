trait T1 {
    virtual fun foo(x: Int): Int {
        return x + 1;
    }
}

trait T2 {
    virtual fun foo(x: Int): Int {
        return x * 2;
    }
}

contract Test2() with T1, T2 {
    // Resolve conflict by overriding foo
    override fun foo(x: Int): Int {
        // For this test, choose to add results from both traits
        // Note: since we don't have explicit trait qualification, we simulate it:
        // We'll compute both behaviors manually inline.
        let res1 = x + 1; // from T1
        let res2 = x * 2; // from T2
        return res1 + res2;
    }

    get fun getTest(): Int {
        return self.foo(4);
    }
}
