contract LargeString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    init() {
        self.s1 = "hello";
        self.s2 = "world";
        self.s3 = "";
        self.s4 = "😊";
        self.s5 = "some long string just to test limits of the serialization behavior";
    }
}
