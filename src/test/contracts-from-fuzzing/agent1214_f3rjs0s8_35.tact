struct IntStr {
    i: Int;
    s: String;
}

struct OuterSet {
    one: IntStr;
    two: IntStr;
}

contract DualNested {
    os: OuterSet;
    init() {
        self.os = OuterSet{
            one: IntStr{ i: 1, s: "x" },
            two: IntStr{ i: 2, s: "y" }
        };
    }
}