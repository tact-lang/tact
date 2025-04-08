contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: String = "abc";

    init() {
        self.a = 10;
        self.b = false;
        self.c = 100;
        self.d = true;
        self.e = "def";
    }
}