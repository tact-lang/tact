contract Test {
    state: Int = 42;
    
    receive () {}

    get fun getPrimitive(): Int {
        return self.state;
    }
}
