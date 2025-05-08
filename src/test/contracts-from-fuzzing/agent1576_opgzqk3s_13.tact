struct Deep {
    level1: Int;
    opt1: Int?;
    level2: Int;
    opt2: Bool?;
    level3: Int;
    opt3: String?;
}

contract DeepOptionMix {
    d: Deep;

    init() {
        self.d = Deep{
            level1: 1,
            opt1: null,
            level2: 2,
            opt2: null,
            level3: 3,
            opt3: "abc",
        };
    }
}