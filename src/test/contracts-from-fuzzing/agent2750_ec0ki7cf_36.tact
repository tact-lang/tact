contract InitOverrides {
    x: Int = 8;
    y: String = "foo";
    
    init() {
        self.x = 99;
        self.y = "bar";
    }
}
