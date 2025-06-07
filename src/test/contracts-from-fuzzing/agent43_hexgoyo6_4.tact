trait T1 {
    virtual fun f(): Int {
        return 1;
    }
}

trait T2 {
    virtual fun f(): Int {
        return 2;
    }
}

contract C() with T1, T2 {
    // Resolving conflict by explicitly overriding function f()
    override fun f(): Int {
        // For example, choose to return sum of T1.f() and T2.f(), but since we can't call trait functions via self without conflict resolution, simply return a constant.
        return 3; // Expected behavior: call f() returns 3
    }
    receive() {
        let result = self.f();
        dump(result); // Expected output: 3
    }
}
