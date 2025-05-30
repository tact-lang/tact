struct Level3 {
    f3: Bool;
}

struct Level2 {
    f2: Level3;
}

struct Level1 {
    f1: Level2;
}

contract DeepStorage {
    content: Level1;
    
    init() {
        self.content = Level1{
            f1: Level2{
                f2: Level3{ f3: false }
            }
        };
    }
}
