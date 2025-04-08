contract LongStrings {
    s1: String = "a";
    s2: String = "bc";
    s3: String = "def";
    s4: String = "ghij";
    s5: String = "klmno";
    s6: String = "pqrstu";
    s7: String = "vwxyzab";
    s8: String = "cdefghij";

    init() {
        self.s8 = "updated";
    }
}