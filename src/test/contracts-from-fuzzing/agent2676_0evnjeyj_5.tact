struct LevelTwo {
    amount: Int = 0;
    desc: String = "none";
}

struct LevelOne {
    flag: Bool = false;
    inner: LevelTwo;
}

contract NestedStructs {
    data: LevelOne = LevelOne{ flag: true, inner: LevelTwo{ amount: 100, desc: "nested" } };

    init() {
        self.data = LevelOne{ flag: false, inner: LevelTwo{ amount: -1, desc: "deep" } };
    }
}