contract BoolIntStrings {
    a: Bool = true;
    b: Int = 1;
    c: String = "c";
    d: Bool = false;
    e: Int = 2;
    f: String = "f";

    init() {
        self.a = false;
        self.b = 42;
        self.c = "abc";
        self.d = true;
        self.e = 7;
        self.f = "def";
    }
    
    receive() {
        self.b = self.b + 1;
    }
}