contract Test {
    v: Int = 42;
    
    receive() {}
    
    get fun getValue(): Int {
         return self.v;
    }
}
