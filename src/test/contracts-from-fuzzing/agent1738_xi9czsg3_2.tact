struct Level3 {
    value: Int;
    note: String;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract Test {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                l3: Level3{ value: 7, note: "deep" },
                optL3: null
            },
            optL2: null
        };
    }
}