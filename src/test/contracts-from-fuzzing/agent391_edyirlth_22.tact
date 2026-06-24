struct TextPair {
    t1: String;
    t2: String;
}

struct LevelTwo {
    first: TextPair;
    second: TextPair;
}

contract DoubleNestedText {
    data: LevelTwo;
    init() {
        self.data = LevelTwo{
            first: TextPair{t1:"hi", t2:"there"},
            second: TextPair{t1:"bye", t2:"now"}
        };
    }
}