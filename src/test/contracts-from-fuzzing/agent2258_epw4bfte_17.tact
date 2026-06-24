contract OnlyStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    receive() {
        let _ = self.s4;
    }
}