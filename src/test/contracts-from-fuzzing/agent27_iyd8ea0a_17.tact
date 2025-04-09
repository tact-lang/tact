struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    other: Int;
}

struct Level1 {
    deep: Level2;
    flag: Bool;
}

contract DeepTree {
    storage: Level1;

    init() {
        self.storage = Level1{
            deep: Level2{
                nested: Level3{val: 777},
                other: 123
            },
            flag: true
        };
    }
}