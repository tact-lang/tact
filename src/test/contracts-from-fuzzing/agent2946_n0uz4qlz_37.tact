contract NestedDefaultOptionals {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = true;
    init() {
        self.a = null;
        self.c = null;
    }
}