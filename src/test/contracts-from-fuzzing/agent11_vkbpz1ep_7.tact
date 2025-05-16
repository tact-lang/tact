struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    info: ManyStrings;

    init() {
        self.info = ManyStrings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}