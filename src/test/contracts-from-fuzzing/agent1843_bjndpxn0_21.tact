struct Level3 {
    val: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract TwoDeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2a: Level2{
                l3a: Level3{val:1},
                l3b: Level3{val:2}},
            l2b: Level2{
                l3a: Level3{val:3},
                l3b: Level3{val:4}}
        };
    }
}
