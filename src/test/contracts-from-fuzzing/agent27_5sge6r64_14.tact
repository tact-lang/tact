struct Level3 {
    z: Int;
    optZ: Bool?;
}

struct Level2 {
    y: Level3;
    optY: Level3?;
}

struct Level1 {
    x: Level2;
    optX: Level2?;
}

contract TestContract {
    top: Level1;
    init() {
        self.top = Level1{
            x: Level2{
                y: Level3{z:1,optZ:null},
                optY: null
            },
            optX: null
        };
    }
}
