struct Large {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract Test {
    big: Large;
    init() {
        self.big = Large{
            s1: "hi1",
            s2: "hi2",
            s3: "hi3",
            s4: "hi4",
            s5: "hi5",
        };
    }
}