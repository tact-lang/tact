struct Level3 {
    x: Int;
}
struct Level2 {
    l3a: Level3;
    l3b: Level3;
}
struct Level1 {
    l2: Level2;
    optL2: Level2?;
}
contract NestedOptionals {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3a: Level3{ x: 1 },
                l3b: Level3{ x: 2 }
            },
            optL2: null
        };
    }
}