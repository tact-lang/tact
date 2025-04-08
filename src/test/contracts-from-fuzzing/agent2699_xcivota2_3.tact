struct Level3 {
    deepVal: Int?;
    deepStr: String;
}

struct Level2 {
    middleVal: Bool;
    nested: Level3;
}

struct Level1 {
    root: Level2;
    optRoot: Level2?;
}

contract DeepNestedStructTest {
    info: Level1;

    init() {
        self.info = Level1{
            root: Level2{
                middleVal: true,
                nested: Level3{
                    deepVal: null,
                    deepStr: "Deep",
                },
            },
            optRoot: null,
        };
    }
}