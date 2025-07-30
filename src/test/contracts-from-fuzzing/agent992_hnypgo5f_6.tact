struct Level3 {
    x: Int;
    opt: Bool?;
}

struct Level2 {
    nested3: Level3;
    flag: Bool;
    note: String?;
}

struct Level1 {
    nested2: Level2;
    amount: Int;
}

contract TestContract {
    deep: Level1;
    init() {
        self.deep = Level1{
            nested2: Level2{
                nested3: Level3{
                    x: 55,
                    opt: null,
                },
                flag: true,
                note: null,
            },
            amount: 1000,
        };
    }
}
