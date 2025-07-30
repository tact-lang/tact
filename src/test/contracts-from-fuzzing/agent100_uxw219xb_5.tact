struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    str: String;
}

struct Level1 {
    deep: Level2;
    flag: Bool;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            deep: Level2{ nested: Level3{val: 1}, str: "ok" },
            flag: false
        };
    }
}