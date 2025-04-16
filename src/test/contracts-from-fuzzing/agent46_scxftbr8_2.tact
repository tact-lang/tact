contract Test {
    v: Int = 100;
    
    receive() {}

    get fun getV() : Int {
        return self.v;
    }
}
