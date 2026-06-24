contract VarDefaultValues {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";

    init() {
        self.a = 2;
        self.b = true;
        self.c = "newstr";
    }
}
