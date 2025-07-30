struct LevelOne {
    val: Int;
    next: LevelTwo;
}

struct LevelTwo {
    val2: Int;
    next2: LevelThree;
}

struct LevelThree {
    comment: String;
}

contract MultiLayer {
    payload: LevelOne;

    init() {
        self.payload = LevelOne{
            val: 1,
            next: LevelTwo{
                val2: 2,
                next2: LevelThree{ comment: "end" }
            }
        };
    }
}
