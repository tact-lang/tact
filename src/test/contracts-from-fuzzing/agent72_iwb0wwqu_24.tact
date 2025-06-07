struct Level1 {
    x: Int;
    y: Int?;
}

struct Level2 {
    a: Level1;
    b: Int;
}

struct Level3 {
    inner: Level2?;
    z: Int;
}

contract DeepMix {
    root: Level3;

    init() {
        self.root = Level3{
            inner: Level2{
                a: Level1{ x:1, y:null },
                b: 42
            },
            z: 100
        };
    }
}