trait T {
    abstract fun a(): Int;
}

contract C() with T {
    override fun a(): Int { return 42; }

    receive() {
        let x = self.a();
        dump(x);
    }
}
