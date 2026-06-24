contract EmptyStringAndBool {
    a: String = "";
    b: Bool = false;
    c: String = "";
    d: Bool = true;

    init() {
        self.a = "hello";
        self.b = true;
        self.c = "world";
        self.d = false;
    }

    receive() {
        self.a = "!";
    }
}