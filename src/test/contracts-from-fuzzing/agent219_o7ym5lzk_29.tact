contract ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    opt1: String?;
    opt2: String?;

    init() {
        self.s1 = "a";
        self.s2 = "b";
        self.s3 = "c";
        self.s4 = "d";
        self.s5 = "e";
        self.opt1 = "f";
        self.opt2 = null;
    }
}