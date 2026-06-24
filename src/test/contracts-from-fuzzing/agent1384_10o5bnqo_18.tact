contract InitWithDefault {
    a: Int;
    b: Int = 0;
    c: Bool;

    init() {
        self.a = 1;
        self.c = true;
    }
}