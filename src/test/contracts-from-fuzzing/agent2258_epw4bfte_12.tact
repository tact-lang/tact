contract EmptyOptStrings {
    s1: String? = null;
    s2: String? = null;
    s3: String? = null;
    s4: String? = null;
    receive() {
        let _ = self.s1;
    }
}