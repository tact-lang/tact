struct ComposeManyLevels {
    level1: Int;
    level2: Int;
    level3: Int;
    level4: Int;
    level5: Int;
    txt1: String;
    txt2: String;
    txt3: String;
    b1: Bool;
    b2: Bool;
}

contract ManyLevelsTest {
    content: ComposeManyLevels;

    init() {
        self.content = ComposeManyLevels{
            level1: 1,
            level2: 2,
            level3: 3,
            level4: 4,
            level5: 5,
            txt1: "one",
            txt2: "two",
            txt3: "three",
            b1: true,
            b2: false,
        };
    }
}