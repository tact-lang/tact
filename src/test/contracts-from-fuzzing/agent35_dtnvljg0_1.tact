trait T1 {
    abstract fun a(): Int;
}

contract C() with T1 {
    override fun a(): Int {
        return 42;
    }
    
    receive() {
        let x = self.a();
        dump(x);
    }
}
