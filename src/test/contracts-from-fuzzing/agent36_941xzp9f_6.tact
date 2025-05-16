contract Test {
    opt: Int? = null;
    
    receive() {}

    // Getter function returning an optional Int
    get fun getOpt(): Int? {
        return self.opt;
    }
}
