struct ManyStringAndBool {
    s1: String;
    b1: Bool;
    s2: String;
    b2: Bool;
}

contract StringsAndBools {
    data: ManyStringAndBool;

    init() {
        self.data = ManyStringAndBool{
            s1: "abc",
            b1: true,
            s2: "def",
            b2: false
        };
    }
}