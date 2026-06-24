struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    l3: Level3;
}

struct Level1 {
    x: Int;
    l2: Level2;
}

contract DeepNested {
    nested: Level1;
    
    init() {
        self.nested = Level1{
            x: 10,
            l2: Level2{
                y: 20,
                l3: Level3{
                    z: 30
                }
            }
        };
    }
}