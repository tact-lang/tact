contract EmptyInitDefaults {
    x: Int = 1;
    y: Int;
    
    init() {
        self.y = 2;
    }
}