contract ReassignDefaults {
    a: Int = 4;
    b: Bool = false;
    c: String = "prev";

    init() {
        self.a = 111;
        self.b = true;
        self.c = "new";
    }
}