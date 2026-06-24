struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3?;
    flag: Bool;
}

struct Level1 {
    mid: Level2;
    txt: String;
}

contract DeepOptional {
    data: Level1;

    init() {
        self.data = Level1{
            mid: Level2{
                nested: null,
                flag: true,
            },
            txt: "abc",
        };
    }
}