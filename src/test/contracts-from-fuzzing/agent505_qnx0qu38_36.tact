contract ManyFieldsAgain {
    a: Int = 1;
    b: Int = 2;
    c: Int? = null;
    d: Bool = false;
    e: Bool? = null;
    f: String = "f";
    g: String? = null;

    init() {
        self.c = 3;
        self.e = true;
        self.g = "g";
    }

    receive() {
        self.a = self.a+1;
    }
}