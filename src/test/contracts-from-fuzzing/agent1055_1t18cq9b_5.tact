struct Level3 {
    z: String;
}

struct Level2 {
    y: Int;
    lvl3: Level3;
}

struct Level1 {
    x: Bool;
    lvl2: Level2;
}

contract DeepNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{
            x: true,
            lvl2: Level2{
                y: 123,
                lvl3: Level3{
                    z: "deep",
                },
            },
        };
    }
}