contract OptionalInitMix {
    a: Int? = null;
    b: Int?;
    c: Int; 
    init() {
        self.b = 5;
        self.c = 42;
    }
}