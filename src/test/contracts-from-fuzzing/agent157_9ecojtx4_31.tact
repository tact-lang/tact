contract NestStructMultiLevel {
    top: LevelOne;

    init() {
        self.top = LevelOne{
            next: LevelTwo{
                next: LevelThree{
                    val: 123
                }
            }
        };
    }
}

struct LevelOne {
    next: LevelTwo;
}

struct LevelTwo {
    next: LevelThree;
}

struct LevelThree {
    val: Int;
}
