struct LevelTwo {
    text: String;
    opt: Bool?;
}

struct LevelOne {
    num: Int;
    nested: LevelTwo;
}

contract MultiNested {
    rec: LevelOne;

    init() {
        self.rec = LevelOne{
            num: 5,
            nested: LevelTwo{
               text: "hi",
               opt: null
            }
        };
    }
}
