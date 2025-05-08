struct Level3 {
    note: String;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    count: Int;
}

contract DeepNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    note: "deep"
                },
                flag: true
            },
            count: 7
        };
    }
}