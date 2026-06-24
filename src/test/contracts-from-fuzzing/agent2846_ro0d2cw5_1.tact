struct DeepNested {
    inner: LevelOne;
}

struct LevelOne {
    next: LevelTwo;
    flag: Bool;
}

struct LevelTwo {
    num: Int;
    maybe: LevelThree?;
}

struct LevelThree {
    val: Int;
    text: String;
}

contract DeepStorage {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner: LevelOne{
                next: LevelTwo{
                    num: 1,
                    maybe: LevelThree{
                        val: 42,
                        text: "hello",
                    },
                },
                flag: true,
            },
        };
    }
}