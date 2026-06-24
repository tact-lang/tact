contract ChainAssign {
    a: Int;
    b: Bool;
    c: String;
    init() {
        self.a = 1; self.b = true; self.c = "x";
    }
    receive() {
        self.a = 2; self.b = false; self.c = "y";
        self.a = 3; self.b = true; self.c = "z";
    }
}