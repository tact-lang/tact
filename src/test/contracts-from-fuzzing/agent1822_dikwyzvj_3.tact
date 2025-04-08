struct DeepNested {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    mid: MiddleLevel;
}

struct MiddleLevel {
    bottom: BottomLevel;
}

struct BottomLevel {
    val: Int;
}

contract DeepTest {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            level1: 1,
            level2: InnerLevel{
                mid: MiddleLevel{
                    bottom: BottomLevel{ val: 99 },
                },
            },
        };
    }
}