contract ManyStrings {
    s1: String = "1";
    s2: String = "2";
    s3: String = "3";
    s4: String = "4";
    s5: String = "5";
    s6: String = "6";
    s7: String = "7";
    s8: String = "8";
    s9: String = "9";
    s10: String = "10";
    receive() {
        let _ = self.s10;
    }
}