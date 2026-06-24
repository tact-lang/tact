contract Test1 {
    v: Int = 42;
    
    receive() {}

    get fun getPrimitive(): Int {
        return self.v;
    }
}