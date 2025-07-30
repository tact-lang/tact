struct Deep {
    level1: Int;
    level2: Int?;
    level3: String;
}

struct Middle {
    deep: Deep;
    middleFlag: Bool;
}

struct Top {
    middle: Middle;
    topVal: Int;
}

contract TestContract {
    state: Top;

    init() {
        self.state = Top{
            middle: Middle{
                deep: Deep{level1: 1, level2: 2, level3: "ok"},
                middleFlag: true
            },
            topVal: 5
        };
    }
}