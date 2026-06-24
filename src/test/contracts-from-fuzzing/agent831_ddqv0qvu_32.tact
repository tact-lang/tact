contract LongStrings {
    s1: String = "short";
    s2: String = "this is a very long string in the storage of the contract";
    s3: String;

    init() {
        self.s3 = "another somewhat long string just to fuzz";
    }
}