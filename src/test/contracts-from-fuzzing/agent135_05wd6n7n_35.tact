contract OptsAndDefaultsInState {
    a: Int?;
    b: Bool = false;
    c: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}
