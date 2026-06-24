contract TestOptional {
    // Persistent state variable of optional Int
    opt: Int?;
    
    receive() {}

    get fun getOptional(): Int? {
        return self.opt;
    }
}
