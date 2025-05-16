struct Level3 {
    value: Int;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    bit: Bool;
}

contract MultiNested {
    m: Level1;

    init() {
        self.m = Level1{
            l2: Level2{
                l3: Level3{ value: 777 },
                flag: true
            },
            bit: false
        };
    }
}