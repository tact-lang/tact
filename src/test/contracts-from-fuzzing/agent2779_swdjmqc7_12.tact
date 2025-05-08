struct ManyStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract LotsOfStrings {
    container: ManyStrings;
    init() {
        self.container = ManyStrings{
            s1: "A",
            s2: "B",
            s3: "C",
            s4: "D"
        };
    }
}