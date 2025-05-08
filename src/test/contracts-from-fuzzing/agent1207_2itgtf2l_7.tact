struct Level3 {
    z: String;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepChain {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: Level2{
                y: Level3{
                    z: "hello"
                }
            }
        };
    }
}