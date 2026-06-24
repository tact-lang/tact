trait T {
    virtual const V: Int = 10;

    fun getV(): Int {
        return self.V;
    }
}

contract C() with T {
    override const V: Int = 20;

    get fun data(): Int {
        return self.getV();
    }

    receive() {
        cashback(sender());
    }
}
