contract ManyStrings {
    s1: String = "alpha";
    s2: String = "beta\\nline";
    s3: String = "gamma 😊";
    s4: String = "delta \"quote\"";
    s5: String = "epsilon\ttab";

    receive() {
        self.s1 = "updated";
    }
}