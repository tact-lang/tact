contract TestChainedGetter {
    v: Int = 5;
    
    receive() {}

    get fun getA(): Int {
        return self.v;
    }

    get fun getB(): Int {
        return self.getA() + 10;
    }
}
