trait Base {
    fun foo(): Int { return 1; }
}

trait Derived with Base {
    fun callFoo(): Int { return self.foo(); }
}

contract Test() with Derived {
    override fun foo(): Int { return 10; }

    receive() {
        let result = self.callFoo();
        dump(result);
    }
}
