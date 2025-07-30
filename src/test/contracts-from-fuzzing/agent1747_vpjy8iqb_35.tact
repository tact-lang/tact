contract PersistentBoolStr {
    a: Bool = true;
    b: String = "hello";

    init() {
        self.a = false;
        self.b = "world";
    }
}