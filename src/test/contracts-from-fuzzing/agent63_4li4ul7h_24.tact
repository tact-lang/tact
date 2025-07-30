contract PersistentOptAndVal {
    a: Int?;
    b: Int = 5;

    init() {
        self.a = null;
        self.b = 10;
    }
}
