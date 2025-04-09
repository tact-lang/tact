struct Level4 {
    w: Int;
}

struct Level3 {
    z: Level4;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

struct Top {
    chain: Level1;
}

contract FourLayerNested {
    nested: Top;

    init() {
        self.nested = Top{
            chain: Level1{
                x: Level2{
                    y: Level3{
                        z: Level4{
                            w: 42
                        }
                    }
                }
            }
        };
    }
}