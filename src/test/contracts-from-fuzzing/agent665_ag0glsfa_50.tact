contract OptionalStringDefaults2 {
    s1: String? = null;
    s2: String? = "";
    s3: String? = "abc";

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }

    receive() {
        let _ = self.s1;
        let _ = self.s2;
        let _ = self.s3;
    }
}