struct Level3 {
    v: Int?;
}

struct Level2 {
    lv3: Level3;
    flag: Bool;
}

struct Level1 {
    lv2: Level2;
    text: String;
}

contract DeepNestedContract {
    value: Level1;

    init() {
        self.value = Level1{
            lv2: Level2{
                lv3: Level3{ v: null },
                flag: true
            },
            text: "test"
        };
    }
}