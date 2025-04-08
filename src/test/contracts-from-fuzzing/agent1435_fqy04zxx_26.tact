contract WithStrings {
    s1: String;
    s2: String = "hello";
    s3: String;
    s4: String = "world";

    init() {
        self.s1 = "foo";
        self.s3 = "bar";
    }
}