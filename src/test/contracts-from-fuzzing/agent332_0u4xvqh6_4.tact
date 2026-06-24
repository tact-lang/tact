struct Level3 {
    z: String?;
}

struct Level2 {
    y: Int;
    l3: Level3;
}

struct Level1 {
    x: Bool?;
    l2: Level2;
}

contract TestContract {
    nested: Level1 = Level1{
        x: null,
        l2: Level2{
            y: 55,
            l3: Level3{ z: null }
        }
    };
    
    init() {
        self.nested.l2.l3 = Level3{ z: "deep" };
    }
}