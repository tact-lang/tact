contract EmptyStringFields {
    s1: String = "";
    s2: String? = null;
    s3: String = "";
    s4: String? = null;

    init() {
        self.s2 = "empty";
        self.s4 = "data";
    }
}
