struct Level3 {
    optInt: Int?;
    str: String;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    deeper: Level2;
}

contract TestContract {
    deepChain: Level1;

    init() {
        self.deepChain = Level1{
            deeper: Level2{
                nested: Level3{
                    optInt: null,
                    str: "test",
                },
                flag: false,
            },
        };
    }
}