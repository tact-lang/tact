contract UninitializedVariables {
    a: Int;
    b: Bool;
    c: Int?;
    init() {
        self.a = 10;
        self.b = true;
        self.c = null;
    }
}