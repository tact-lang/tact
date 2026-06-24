contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "data";
        self.d = 42;
        self.e = "opt";
    }
}
