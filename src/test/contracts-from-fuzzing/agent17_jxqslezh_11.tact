trait A {
    // Abstract function f must be overridden by inheriting contract
    abstract fun f(): Int;

    // Function h calls f() and adds 10, testing polymorphism
    fun h(): Int {
        return self.f() + 10;
    }
}

contract D() with A {
    // Override f() to return 5
    override fun f(): Int {
        return 5;
    }

    // Getter to test h()
    get fun test(): Int {
        return self.h();
    }
}
