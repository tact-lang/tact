trait A {
    fun foo(): Int {
        return 1;
    }
}

trait B {
    fun foo(): Int {
        return 2;
    }
}

contract C() with A, B {
    // Resolving method conflict by overriding foo
    override fun foo(): Int {
        return 100;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}
