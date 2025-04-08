struct Level1 {
    lv2: Level2;
    f1: Int;
}

struct Level2 {
    lv3: Level3;
    f2: Bool;
}

struct Level3 {
    lv4: Level4;
    f3: String;
}

struct Level4 {
    lv5: Level5;
    f4: Int?;
}

struct Level5 {
    f5: Int;
    f6: Bool?;
}

contract Test {
    root: Level1;

    init() {
        self.root = Level1{
            lv2: Level2{
                lv3: Level3{
                    lv4: Level4{
                        lv5: Level5{
                            f5: 99,
                            f6: null
                        },
                        f4: null
                    },
                    f3: "deep"
                },
                f2: true
            },
            f1: 1
        };
    }
}