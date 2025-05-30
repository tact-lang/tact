contract DefaultsAllowed {
    a: Int = 7;
    b: Bool = false;
    c: String = "xyz";

    init() {
        self.a = 11;
        self.b = true;
        self.c = "done";
    }
}