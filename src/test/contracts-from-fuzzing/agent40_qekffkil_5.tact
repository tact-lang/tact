contract TestOptional {
    // Optional Int - default is null if not explicitly initialized
    opt: Int?;
    
    get fun getOpt(): Int? {
        return self.opt;
    }
    
    receive() {}
}
