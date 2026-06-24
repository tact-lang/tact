struct Level3 { x: Int; y: Bool }

struct Level2 { 
    l3: Level3;
    flag2: Bool;
    opt2: Int?;
}

struct Level1 {
    l2: Level2;
    val1: Int;
    opt1: Bool?;
}

contract DeepNested {
    data: Level1;
    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{ x:4, y:true },
                flag2: false,
                opt2: null
            },
            val1: 42,
            opt1: null
        };
    }
}