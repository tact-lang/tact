contract PersistentStrings {
    s1: String;
    s2: String;
    s3: String?;

    init() {
        self.s1 = "hello";
        self.s2 = "world";
        self.s3 = null;
    }
}