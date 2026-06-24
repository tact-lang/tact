contract StringFields {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;

    init() {
        self.s1 = "hey";
        self.s2 = null;
        self.s3 = "world";
        self.s4 = "!";
    }
}