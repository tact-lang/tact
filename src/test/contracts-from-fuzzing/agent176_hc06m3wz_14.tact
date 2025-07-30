contract OnlyStringFields {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";

    init() {
        self.s1 = "x";
        self.s6 = "y";
    }
}