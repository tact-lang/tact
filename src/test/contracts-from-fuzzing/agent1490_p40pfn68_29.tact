contract PersistentOnlyDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";

    init() {
        self.a = 10;
        self.b = false;
        self.c = "y";
    }
}