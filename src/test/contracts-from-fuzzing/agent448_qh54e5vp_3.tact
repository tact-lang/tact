struct Level3 { flag: Bool; }
struct Level2 { mid: Level3; }
struct Level1 { inner: Level2; }

contract DeepNested {
    deepField: Level1;
    
    init() {
        self.deepField = Level1{ inner: Level2{ mid: Level3{ flag: true } } };
    }
}