contract NestedInits {
    a: Int;
    b: Bool;
    c: String;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.a = 5;
        self.b = false;
        self.c = "y";
    }
}