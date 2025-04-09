struct Level3 {
    leaf1: Int;
    leaf2: Bool;
    leaf3: String;
}

struct Level2 {
    sub1: Level3;
    sub2: Bool;
}

struct Level1 {
    nested: Level2;
    value: Int?;
}

contract NestedStorageTest {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{
                sub1: Level3{
                    leaf1: 1,
                    leaf2: true,
                    leaf3: "test",
                },
                sub2: false,
            },
            value: null,
        };
    }
}
