trait T1 {
    abstract const X: Int;

    fun getXFromT1(): Int { return self.X; }
}

trait T2 {
    abstract const X: Int;

    fun getXFromT2(): Int { return self.X * 2; }
}

contract C() with T1, T2 {
    override const X: Int = 5;

    receive() {
        let a = self.getXFromT1();
        let b = self.getXFromT2();
        dump(a + b);
    }
}
