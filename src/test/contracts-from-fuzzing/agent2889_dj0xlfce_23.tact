contract DefaultsAndOptionals {
    a: Int? = null;
    b: Bool? = true;
    c: String = "hello";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "bye";
    }
}