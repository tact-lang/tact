struct NestedTwoLevels {
    foo: LevelOne;
}

struct LevelOne {
    bar: LevelTwo;
}

struct LevelTwo {
    flag: Bool;
    message: String;
}

contract TestContract {
    info: NestedTwoLevels;

    init() {
        self.info = NestedTwoLevels{
            foo: LevelOne{
                bar: LevelTwo{
                    flag: false,
                    message: "test"
                }
            }
        };
    }
}
