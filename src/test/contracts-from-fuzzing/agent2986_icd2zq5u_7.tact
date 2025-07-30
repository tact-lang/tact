struct LevelTwo {
    a: Int;
    b: Bool;
    c: String;
}

struct LevelOne {
    s1: LevelTwo;
    s2: LevelTwo;
}

contract NestedMultiStruct {
    composed: LevelOne;

    init() {
        self.composed = LevelOne{
            s1: LevelTwo{ a: 11, b: true, c: "first" },
            s2: LevelTwo{ a: 22, b: false, c: "second" }
        };
    }
}