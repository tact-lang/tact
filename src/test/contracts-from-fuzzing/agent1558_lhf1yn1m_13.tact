struct Level4 {
    a: Int;
    b: Bool;
}

struct Level3 {
    l4: Level4;
    optL4: Level4?;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract DeepOptional {
    root: Level1;
    
    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{a:1,b:true},
                    optL4: null,
                },
                optL3: null,
            },
            optL2: null,
        };
    }
}
