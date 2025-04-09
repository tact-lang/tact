contract Test {
    v: Int = 42;
    
    // the required receive function
    receive() {}

    get fun getV(): Int {
        return self.v;
    }
}
