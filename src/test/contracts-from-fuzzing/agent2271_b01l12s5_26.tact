struct LargerNested {
    one: Int;
    two: Bool;
    three: SubOne;
    four: SubTwo;
    five: SubThree;
}

struct SubOne {
    x: Int;
}

struct SubTwo {
    y: Bool;
}

struct SubThree {
    z: String;
}

contract LargerStructContract {
    s: LargerNested;

    init() {
        self.s = LargerNested{
            one: 1,
            two: true,
            three: SubOne{ x: 2 },
            four: SubTwo{ y: false },
            five: SubThree{ z: "str" },
        };
    }
}