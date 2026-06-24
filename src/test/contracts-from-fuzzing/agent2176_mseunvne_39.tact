contract StringsNulls {
    s1: String?;
    s2: String;
    
    init() {
        self.s1 = null;
        self.s2 = "hi";
    }
}
