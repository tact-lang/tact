contract TestContract {
    a: Int = 1;
    b: Bool;
    c: String;
    d: Int?;

    init() {
        self.b = true;
        self.c = "x";
        self.d = null;
    }
}