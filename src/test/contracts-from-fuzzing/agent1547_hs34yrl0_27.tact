contract NestedOpt {
    x: Int?;
    y: Bool?;

    init() {
        self.x = null;
        self.y = null;
    }
    
    receive() {
        self.x = 123;
        self.y = true;
    }
}