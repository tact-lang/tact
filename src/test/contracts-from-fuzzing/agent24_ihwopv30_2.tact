trait T {
    abstract fun f(): Int;
}

contract A() with T {
    override fun f(): Int {
        return 42;
    }

    receive() {
        let x = self.f();
        dump(x);
    }
}
