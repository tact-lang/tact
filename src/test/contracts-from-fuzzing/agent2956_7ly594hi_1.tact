struct DeepNested {
    layer1: LevelOne;
}

struct LevelOne {
    layer2: LevelTwo;
}

struct LevelTwo {
    layer3: LevelThree;
}

struct LevelThree {
    message: String;
    flag: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            layer1: LevelOne{
                layer2: LevelTwo{
                    layer3: LevelThree{
                        message: "hello",
                        flag: true,
                    },
                },
            },
        };
    }
}
