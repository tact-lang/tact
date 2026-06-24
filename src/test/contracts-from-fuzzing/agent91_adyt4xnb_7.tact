contract Test6 {
    v: Int = 100;
    
    receive() {}
    
    get fun unusedGetter(): Int {
        return self.v;
    }
}
