contract StringOptionalFields {
    s1: String? = null;
    s2: String?;
    s3: String = "abc";

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = "updated";
    }
}