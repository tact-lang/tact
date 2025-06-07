struct Level3 {
    z: Int?;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
}

contract DeepNestedTest {
    data: Level1;
    
    init() {
        self.data = Level1{ nested: Level2{ inner: Level3{ z: null }, flag: false } };
    }
}