struct MixNested {
    inner1: Level1;
    inner2: Level1;
}

struct Level1 {
    x: Int;
    y: Bool;
    z: Level2;
}

struct Level2 {
    message: String;
    flag: Bool?;
    num: Int?;
}

contract NestedMixedStorage {
    val: MixNested;

    init() {
        self.val = MixNested{
            inner1: Level1{
                x: 1,
                y: true,
                z: Level2{
                    message: "a",
                    flag: null,
                    num: 2
                }
            },
            inner2: Level1{
                x: 3,
                y: false,
                z: Level2{
                    message: "b",
                    flag: true,
                    num: null
                }
            }
        };
    }
}