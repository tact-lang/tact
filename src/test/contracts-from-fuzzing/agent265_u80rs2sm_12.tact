struct NestedStrings {
    s1: String;
    s2: String;
}

struct StringOuter {
    one: NestedStrings;
    two: NestedStrings;
}

contract DoubleNestedStr {
    hold: StringOuter;

    init() {
        self.hold = StringOuter{
            one: NestedStrings{ s1:"a", s2:"b" },
            two: NestedStrings{ s1:"c", s2:"d" }
        };
    }

    receive() {
        self.hold = self.hold;
    }
}