struct LevelTwo {
    optionalText: String?;
    level: Int;
}

struct LevelOne {
    val: Int;
    nested: LevelTwo;
}

contract TestContract {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            val: 1,
            nested: LevelTwo{ optionalText: null, level: 2 }
        };
    }

    receive() {
        self.data = LevelOne{
            val: 99,
            nested: LevelTwo{ optionalText: "hello world", level: -5 }
        };
    }
}