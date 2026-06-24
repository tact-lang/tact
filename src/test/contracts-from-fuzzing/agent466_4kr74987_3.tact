struct Level3 {
    flag: Bool;
}

struct Level2 {
    inside: Level3;
    amount: Int?;
}

struct Level1 {
    nested: Level2;
    status: Bool?;
}

contract MultiLevel {
    persist: Level1;

    init() {
        self.persist = Level1{
            nested: Level2{
                inside: Level3{flag: false},
                amount: null
            },
            status: null
        };
    }
}