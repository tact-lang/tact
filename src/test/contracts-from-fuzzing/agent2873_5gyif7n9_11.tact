contract EmptyStringDefaults {
    s1: String = "";
    s2: String = "";
    
    init() {
        self.s1 = "start";
        self.s2 = "end";
    }
}