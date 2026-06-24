struct DeepInside {
    flag: Bool;
    text: String;
}

struct Middle {
    nested: DeepInside;
    num: Int;
}

contract Test {
    middle: Middle;

    init() {
        self.middle = Middle{
            nested: DeepInside{
                flag: false,
                text: "Deep",
            },
            num: 42,
        };
    }
}