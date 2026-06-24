contract ReassignOptionals {
    a: Int?;
    b: String?;

    init() {
        self.a = null;
        self.b = null;
        self.a = 5; 
        self.b = "hi";
    }
}
