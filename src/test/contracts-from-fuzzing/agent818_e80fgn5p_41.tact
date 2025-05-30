contract ComboDefaultsInits {
    a: Int;
    b: Int? = null;
    c: Bool = true;
    d: String?;
    
    init() {
        self.a = 1;
        self.d = "abc";
    }
}