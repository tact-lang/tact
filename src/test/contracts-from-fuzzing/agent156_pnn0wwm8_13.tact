struct OnlyString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract OnlyStringFields {
    info: OnlyString;

    init() {
        self.info = OnlyString{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d"
        };
    }
}
