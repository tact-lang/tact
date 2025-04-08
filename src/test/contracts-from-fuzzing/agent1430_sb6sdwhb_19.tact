contract DefaultValsContract {
    a: Int = 5;
    b: Bool = true;
    s: String = "hi";

    init() {
        self.a = 123;
        self.b = false;
        self.s = "bye";
    }
}
