contract StringFields {
    a: String;
    b: String?;
    
    init() {
        self.a = "foo";
        self.b = null;
    }
}