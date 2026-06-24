struct Level3 {
    a: Bool;
    b: Int;
}

struct Level2 {
    lv3: Level3;
    flag: Bool?;
    count: Int;
}

struct Level1 {
    lv2: Level2;
    message: String;
}

contract DeepNestedStore {
    storage: Level1;

    init() {
        self.storage = Level1{
            lv2: Level2{
                lv3: Level3{ a: true, b: 42 },
                flag: null,
                count: 7,
            },
            message: "hello",
        };
    }
}