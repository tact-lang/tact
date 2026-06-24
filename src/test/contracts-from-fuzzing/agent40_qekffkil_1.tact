contract Test1 {
    v: Int = 42;
    
    get fun getV(): Int {
        return self.v;
    }
    
    receive() {}
}
