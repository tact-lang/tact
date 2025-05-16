trait A {
    fun f(): Int { return 1; }
}

trait B {
    fun f(): Int { return 2; }
}

contract C() with A, B {
    // Due to multiple inheritance, we override f()
    override fun f(): Int {
        // Manually combine the results, as there's no direct way to invoke A.f() or B.f()
        return 1 + 2; // Expected result is 3
    }

    get fun result(): Int {
        return self.f();
    }

    receive() {
        // Dummy call to prevent optimization out
        let _ = self.result();
        cashback(sender());
    }
}
