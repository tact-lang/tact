contract Test {
    const MY_CONSTANT: Int = 42;
    
    get fun getConst(): Int {
        return self.MY_CONSTANT;
    }
}
