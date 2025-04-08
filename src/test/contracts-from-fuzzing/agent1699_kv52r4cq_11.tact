message(42) Level3Msg {
    k: Int;
}

struct Level2Struct {
    m: Level3Msg;
}

struct Level1Struct {
    nested: Level2Struct;
}

contract DeepNestedMix {
    storage: Level1Struct;

    init() {
        self.storage = Level1Struct{
            nested: Level2Struct{
                m: Level3Msg{
                    k: 777,
                },
            },
        };
    }
}