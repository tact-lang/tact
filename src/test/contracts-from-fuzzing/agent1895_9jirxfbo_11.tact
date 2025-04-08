struct StageOne {
    i: Int;
    flag: Bool;
}

struct StageTwo {
    one: StageOne;
    text: String;
}

struct StageThree {
    optTwo: StageTwo?;
    requiredTwo: StageTwo;
}

contract MultiNestedOpt {
    nested: StageThree;
    init() {
        self.nested = StageThree{
            optTwo: null,
            requiredTwo: StageTwo{
                one: StageOne{ i:10, flag:true },
                text: "hi"
            }
        };
    }
}