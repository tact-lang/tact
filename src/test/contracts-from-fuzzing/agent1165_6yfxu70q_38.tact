contract BigStrings {
    a: String;
    b: String;
    c: String;
    
    init() {
        self.a = "First string test";
        self.b = "Second string, larger test string to check serialization behaviour";
        self.c = "Third super extra long string just to increase size a bit more and test edge cases";
    }
}
