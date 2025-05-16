struct Level3 {
    deepVal: Int;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    name: String;
}

contract DeepTreeStructTest {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                inner: Level3{
                    deepVal: 123
                },
                flag: true
            },
            name: "deep"
        };
    }
}