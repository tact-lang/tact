contract Test3 {
    // State variable of optional type, default is null
    state: Int? = null;
    
    receive () {}
    
    // Getter function returning an optional Int value
    get fun getOptional(): Int? {
        return self.state;
    }
}
