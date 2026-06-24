contract DefaultedFields {
    a: Int = 0;
    b: Bool = false;
    c: String = "";

    init() {
        self.a = 10;
        self.b = true;
        self.c = "abc";
    }

    receive() {}
}