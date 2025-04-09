contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    s: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "set";
        self.d = 20;
        self.e = false;
        self.s = "done";
    }
}