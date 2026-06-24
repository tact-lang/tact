struct Deep {
    level1: Int;
    level2: Bool;
    level3: String;
    level4: Int?;
}

contract ManyTypes {
    deep: Deep;
    init() {
        self.deep = Deep{
            level1: 7,
            level2: false,
            level3: "hi",
            level4: null
        };
    }
}
