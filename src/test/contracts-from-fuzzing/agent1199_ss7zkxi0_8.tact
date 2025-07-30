contract TestContract {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    trivial: Int;

    init() {
        self.s1 = "hello";
        self.s2 = "world";
        self.s3 = "this";
        self.s4 = "is";
        self.s5 = "fuzz";
        self.trivial = 42;
    }
}