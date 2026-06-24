contract ManyOptionals {
    a: Int? = null;
    b: Int? = null;
    c: Bool? = null;
    d: Bool? = null;
    e: String? = null;
    f: String? = null;
    g: Address? = null;
    h: Address? = null;

    init() {
        self.a = 1;
        self.c = true;
        self.e = "hi";
        self.g = myAddress();
    }

    receive() {
        if (self.a != null) { self.a = self.a!! +1; }
    }
}