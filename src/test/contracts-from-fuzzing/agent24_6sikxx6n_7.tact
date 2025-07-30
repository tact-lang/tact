trait Base {
    abstract fun foo(): Int;
}

contract Impl() with Base {
    override fun foo(): Int {
        return 5;
    }

    get fun test(): Int {
        return self.foo();
    }
}

// Expected behavior: Impl.test should return 5.