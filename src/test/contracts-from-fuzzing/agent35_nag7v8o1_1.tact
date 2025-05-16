contract TestPrimitive {
    v: Int = 42;
    
    receive() {}

    get fun getV(): Int {
        return self.v;
    }
}
