contract InitUnusedFields {
    a: Int;
    b: String = "hello";
    
    init() {
        self.a = 7;
    }
}