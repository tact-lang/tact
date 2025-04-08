struct LevelTwo {
    a: Int;
    b: Int?;
}

struct LevelOne {
    nested: LevelTwo;
    c: Bool;
}

contract DeepContract {
    s: LevelOne;
    
    init() {
        self.s = LevelOne{ nested: LevelTwo{ a: 5, b: null }, c: true };
    }
}