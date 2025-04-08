struct Level3 { a: Int; b: Int; }
struct Level2 { x: Level3; y: Level3; }
struct Level1 { l2: Level2; z: Int; }
contract MultipleNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            l2: Level2{
                x: Level3{a:1,b:2},
                y: Level3{a:3,b:4}
            },
            z: 5
        };
    }
}