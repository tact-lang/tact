contract MixedOptionals {
    a: Int? = null;
    b: Bool = true;
    c: String? = null;
    d: Bool? = null;

    init() {
        self.a = 7;
        self.b = false;
        self.c = "beep";
        self.d = true;
    }
}