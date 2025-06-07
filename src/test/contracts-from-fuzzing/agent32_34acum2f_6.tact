contract Test {
    opt: Int? = null;
    
    receive() {}
    
    // Getter returning an optional state variable
    get fun getOpt(): Int? {
        return self.opt;
    }
}
