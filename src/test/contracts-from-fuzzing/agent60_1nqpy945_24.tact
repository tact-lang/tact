contract TestContract {
    a: Int = 1;
    b: Int?;
    c: Bool;
    d: String;

    init() {
        self.b = null;
        self.c = true;
        self.d = "test";
    }
}