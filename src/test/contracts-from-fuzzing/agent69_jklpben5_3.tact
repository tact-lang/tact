struct Level3 {
    val3: Int;
}

struct Level2 {
    nested3: Level3;
    opt3: Int?;
}

struct Level1 {
    nested2: Level2;
    opt2: String?;
}

contract TripleNest {
    nest: Level1;
    
    init() {
        self.nest = Level1{
            nested2: Level2{
                nested3: Level3{val3: 42},
                opt3: null
            },
            opt2: null
        };
    }
}
