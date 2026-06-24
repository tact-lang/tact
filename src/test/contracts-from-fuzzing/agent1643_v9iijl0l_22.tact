struct ManyStrings {
    x: String;
    y: String;
    z: String;
}

contract ManyStringFields {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            x: "A",
            y: "B",
            z: "C"
        };
    }
}
