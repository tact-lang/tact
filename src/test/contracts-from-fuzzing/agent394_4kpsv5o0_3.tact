struct Level3 {
    val: Int?;
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
    s: String;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract NestedDeep {
    state: Level1;
    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{val: 10, flag: true},
                optL3: null,
                s: "deep"
            },
            optL2: null
        };
    }
}