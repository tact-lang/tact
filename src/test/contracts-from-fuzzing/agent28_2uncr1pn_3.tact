trait T {
    abstract const overrideMe: Int;
}

contract C() with T {
    override const overrideMe: Int = 42;
    
    get fun getC(): Int {
        return self.overrideMe;
    }
}
