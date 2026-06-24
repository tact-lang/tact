struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
    s: String;
}

struct Level1 {
    l2: Level2;
    b: Bool;
}

contract TestContract {
    l1: Level1;
    
    init() {
        self.l1 = Level1{
            l2: Level2{ l3: Level3{ a: 42 }, s: "deep" },
            b: true
        };
    }
}
