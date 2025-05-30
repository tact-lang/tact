contract TestOptional {
    v: Int? = 42;
    
    receive() {}
    
    get fun getOptional(): Int? {
        return self.v;
    }
}
