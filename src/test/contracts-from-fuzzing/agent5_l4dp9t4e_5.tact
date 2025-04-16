contract GoodGetter {
    x: Int;
    
    init() {
        self.x = 1;
    }

    // Valid getter: reads state without modification
    get fun getX(): Int {
        return self.x;
    }
}
