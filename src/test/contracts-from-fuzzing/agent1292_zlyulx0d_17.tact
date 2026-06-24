struct StructWithString {
    text: String;
}

struct TwoStrings {
    s1: StructWithString;
    s2: StructWithString;
}

contract ManyStrings {
    data: TwoStrings;

    init() {
        self.data = TwoStrings{
            s1: StructWithString{ text: "Alpha" },
            s2: StructWithString{ text: "Beta" },
        };
    }
}