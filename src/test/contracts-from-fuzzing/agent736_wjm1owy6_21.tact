contract TestContract {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String? = null;
    s5: String? = null;
    s6: String? = null;

    init() {
        self.s1 = "a";
        self.s2 = "b";
        self.s3 = "c";
        self.s4 = null;
        self.s5 = null;
        self.s6 = null;
    }

    receive() {
        dump(self.s3);
    }
}