struct Stru {
    s1: String;
    s2: String;
    s3: String;
}

contract ComposeStr {
    textData: Stru;

    init() {
        self.textData = Stru{
            s1: "1",
            s2: "2",
            s3: "3"
        };
    }
}