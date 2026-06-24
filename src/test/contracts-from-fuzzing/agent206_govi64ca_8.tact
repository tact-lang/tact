contract ManyStringsAndBoolOptional {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";
    flag: Bool? = null;

    init() {
        self.flag = true;
    }
}
