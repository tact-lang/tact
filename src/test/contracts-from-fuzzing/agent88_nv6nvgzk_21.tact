contract TestFields {
    a: Int = 1;
    b: Int; 
    c: Bool = true;

    init() {
        self.b = 5;
        self.c = false;
    }
}