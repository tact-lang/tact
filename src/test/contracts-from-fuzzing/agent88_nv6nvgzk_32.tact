contract ConstAccess {
    const VAL: Int = 42;
    
    x: Int;

    init() {
        self.x = self.VAL;
    }
}