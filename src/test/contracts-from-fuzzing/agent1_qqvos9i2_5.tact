trait T {
    virtual const c: Int = 5;
    fun getC(): Int {
        return self.c;
    }
}

contract C() with T {
    override const c: Int = 7;
    receive() {
        dump(self.getC());
    }
}
