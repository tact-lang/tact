struct HasString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    strData: HasString;

    init() {
        self.strData = HasString{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
            s5: "five",
        };
    }
}