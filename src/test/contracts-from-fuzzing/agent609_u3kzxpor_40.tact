contract PersistenceMix {
    a: Int;
    b: Bool? = null;
    c: String;
    d: Bool = false;

    init() {
        self.a = -123;
        self.b = true;
        self.c = "persist";
        self.d = true;
    }
}