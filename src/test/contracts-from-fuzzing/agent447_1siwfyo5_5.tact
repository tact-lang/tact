struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
}

contract OptionalFields {
    f1: NestedOptionals?;
    f2: String?;
    f3: Bool?;
    f4: Int?;
    f5: NestedOptionals?;
    
    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.f5 = null;
    }
}