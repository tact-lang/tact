contract Test1 {
    v: Int = 123;
    
    receive() {}

    get fun getV(): Int {
         return self.v;
    }
}
