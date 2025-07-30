// Contract with large string fields, to test string serialization
contract BigStrings {
    str1: String;
    str2: String;

    init() {
        self.str1 = "this is a big string constant used for testing";
        self.str2 = "another large string constant for fuzzing";
    }

    receive() {
        if (self.str1 != "") {
            self.str2 = "modified";
        }
    }
}