trait TestTrait {
    abstract fun test(): Int;
}

contract TestContract() with TestTrait {
    override fun test(): Int {
        return 42;
    }

    receive() {
        let x = self.test();
    }
}
