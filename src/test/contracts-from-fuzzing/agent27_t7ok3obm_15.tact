struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract ManyStringsContract {
    hold: ManyStrings;
    
    init() {
        self.hold = ManyStrings{
            s1: "one",
            s2: "two",
            s3: "three"
        };
    }
}
