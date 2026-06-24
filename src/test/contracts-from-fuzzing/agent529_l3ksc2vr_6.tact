contract DefaultFields {
    a: Int = 5;
    b: Bool = false;
    c: String = "def";

    init() {
        self.a = 6;
        self.b = true;
        self.c = "changed";
    }
}