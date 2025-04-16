struct Deep {
    level1: Int;
    level2: Int?;
    level3: String;
    level4: Bool?;
    level5: String;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            level1: 1,
            level2: null,
            level3: "deep",
            level4: true,
            level5: "nest",
        };
    }
}
