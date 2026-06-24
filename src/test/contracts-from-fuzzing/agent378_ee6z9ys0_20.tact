contract TestContract {
    a: Int = 5;
    b: String = "abc";
    c: Bool = true;
    d: Int? = null;
    e: Bool? = false;

    init() {
        self.a = 10;
        self.b = "def";
        self.c = false;
        self.d = 20;
        self.e = true;
    }
}