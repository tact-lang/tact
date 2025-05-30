contract LargeStringFields {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;

    init() {
        self.s1 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        self.s2 = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
        self.s3 = "cccccccccccccccccccccccccccccccccccccccccccccccccc";
        self.s4 = "dddddddddddddddddddddddddddddddddddddddddddddddddd";
        self.s5 = "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
    }
}
