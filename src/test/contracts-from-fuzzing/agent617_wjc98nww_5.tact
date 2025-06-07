struct Level1 {
    a: Int;
}
struct Level2 {
    b: Int;
    l1: Level1;
}
struct Level3 {
    c: Int;
    l2: Level2;
}
struct Level4 {
    d: Int;
    l3: Level3;
}
struct Level5 {
    e: Int;
    l4: Level4;
}
contract VeryDeep {
    nested: Level5;
    init() {
        self.nested = Level5{
            e: 5,
            l4: Level4{
                d: 4,
                l3: Level3{
                    c: 3,
                    l2: Level2{
                        b: 2,
                        l1: Level1{ a:1 }
                    }
                }
            }
        };
    }
}
