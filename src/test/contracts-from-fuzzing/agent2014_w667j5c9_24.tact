contract StringDefault {
    s1: String = "abc";
    s2: String = "";
    s3: String = " ";

    init() {
        self.s1 = "111";
        self.s2 = "222";
        self.s3 = "333";
    }
}