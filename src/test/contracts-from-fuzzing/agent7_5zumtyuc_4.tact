trait T {
    abstract const C: Int;
    virtual const D: Int = 10;
    fun test(): Int { return self.C + self.D; }
}

contract E() with T {
    override const C: Int = 5;
    override const D: Int = 20;
    receive() {
        dump(self.test());
    }
}
