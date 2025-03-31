contract Test {
    v: Int = 10;
    
    get fun nestedGetter(): Int {
        { 
            return self.v;
        }
    }
}
