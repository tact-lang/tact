contract MultiDefaultAndManualInit {
    a: Int = 5;
    b: Int;
    c: String = "x";

    init() {
        self.b = 7;
        self.c = "y";
    }
}