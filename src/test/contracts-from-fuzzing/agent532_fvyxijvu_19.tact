struct HasString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
}

contract ManyStringStruct {
    content: HasString;

    init() {
        self.content = HasString{
            s1: "1",
            s2: "2",
            s3: "3",
            s4: "4",
            s5: "5",
            s6: "6"
        };
    }
}