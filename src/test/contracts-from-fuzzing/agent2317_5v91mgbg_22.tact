struct ManyStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";
}

contract StringFields {
    data: ManyStrings;

    init() {
        self.data = ManyStrings{
            s1: "A",
            s2: "B",
            s3: "C",
            s4: "D",
            s5: "E",
            s6: "F",
        };
    }
}