contract Test {
    a: Int = 42;
    
    receive() {}

    get fun getA() : Int {
        return self.a;
    }
}