struct JustStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StringFieldsContract {
    f: JustStrings = JustStrings{
        s1: "one",
        s2: "two",
        s3: "three",
        s4: "four"
    };
    receive() {
        let _ = self.f.s4;
    }
}