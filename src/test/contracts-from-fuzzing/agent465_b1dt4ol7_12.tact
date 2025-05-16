struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
    opt: String?;
}

struct Level1 {
    nested: Level2;
    optInt: Int?;
    flag: Bool;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{ nested: Level3{ val: 7 }, opt: "x" },
            optInt: null,
            flag: true,
        };
    }
}
