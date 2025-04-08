contract LargeStrings {
    s1: String;
    s2: String;
    s3: String;

    init() {
        self.s1 = "abcdefghijklmnopqrstuvwxyz";
        self.s2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        self.s3 = "0123456789!@#$%^&*()";
    }
}