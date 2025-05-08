contract PartialDefaults {
    a: Int = 2;
    b: Bool; 
    c: String;

    init() {
        self.b = true;
        self.c = "foo";
    }
}