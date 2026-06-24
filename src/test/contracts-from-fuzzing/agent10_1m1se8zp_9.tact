struct DeeplyNested {
    inner1: Level1;
}

struct Level1 {
    inner2: Level2;
}

struct Level2 {
    inner3: Level3;
}

struct Level3 {
    inner4: Level4;
}

struct Level4 {
    x: Int;
    y: Bool;
    z: String?;
}

contract DeepNest {
    data: DeeplyNested;
    init() {
        self.data = DeeplyNested{
            inner1: Level1{
                inner2: Level2{
                    inner3: Level3{
                        inner4: Level4{
                            x: 1,
                            y: true,
                            z: null,
                        },
                    },
                },
            },
        };
    }
}
