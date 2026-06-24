struct Level3 {
    val: Int?;
    flag: Bool;
}

struct Level2 {
    inner: Level3;
    text: String;
}

struct Level1 {
    nested: Level2;
    addr: Address?;
}

contract VeryDeepNesting {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{
                    val: 99,
                    flag: false,
                },
                text: "deep",
            },
            addr: null,
        };
    }
}