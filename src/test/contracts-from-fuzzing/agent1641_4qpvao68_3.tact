struct Level2 {
    flag: Bool;
    text: String = "L2";
}

struct Level1 {
    num: Int;
    nested: Level2;
}

contract DeepNest {
    data: Level1 = Level1{num: 7, nested: Level2{flag: true, text: "deep"}};

    init() {
        self.data = Level1{num: 11, nested: Level2{flag: false, text: "deeper"}};
    }
}