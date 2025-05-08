contract LongStringDefaults {
    str1: String = "a";
    str2: String = "longer string with spaces";
    str3: String = "";
    receive() {
        let _ = self.str2;
    }
}