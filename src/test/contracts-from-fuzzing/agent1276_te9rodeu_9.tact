struct LevelOne {
    flag: Bool;
    value: Int;
    txt: String;
}

struct LevelTwo {
    oneA: LevelOne;
    oneB: LevelOne;
    description: String;
}

contract TwoLargeStructs {
    data: LevelTwo;

    init() {
        self.data = LevelTwo{
            oneA: LevelOne{ flag: true, value: 42, txt: "hello" },
            oneB: LevelOne{ flag: false, value: 99, txt: "world" },
            description: "combined"
        };
    }
}