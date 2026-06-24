contract OnlyStrings {
    s1: String = "one";
    s2: String = "two";
    s3: String?;

    init() {
        self.s3 = "three";
    }
}