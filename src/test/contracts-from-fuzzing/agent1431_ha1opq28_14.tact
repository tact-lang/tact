struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    ms: ManyStrings;

    init() {
        self.ms = ManyStrings{
            s1: "a",
            s2: "b",
            s3: "c",
            s4: "d",
            s5: "e"
        };
    }
}