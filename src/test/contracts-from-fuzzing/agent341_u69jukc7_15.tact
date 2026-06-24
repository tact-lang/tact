struct MultiLevel {
    a: Level1;
    b: Level2;
}

struct Level1 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    text: String;
    c: Level3?;
}

struct Level3 {
    nestedVal: Int?;
    nestedStr: String?;
}

contract TestContract {
    data: MultiLevel;

    init() {
        self.data = MultiLevel{
            a: Level1{ val:3, flag:true },
            b: Level2{ text: "hi", c: Level3{ nestedVal: null, nestedStr: null } }
        };
    }
}