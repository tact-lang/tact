contract TestGetterOptional {
    // Optional state variable
    opt: Int?;
    
    init() {
        self.opt = 10;
    }
    
    receive() {}
    
    // Getter returns an optional Int
    get fun getOptional(): Int? {
        return self.opt;
    }
}
