struct LongString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract MultipleStrings {
    x: LongString;
    init() {
        self.x = LongString{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four",
            s5: "five"
        };
    }
}