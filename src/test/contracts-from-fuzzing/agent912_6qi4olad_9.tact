struct Level1 {
    a: Int?;
}

struct Level2 {
    a: Int;
    l1: Level1?;
}

struct Level3 {
    l2: Level2?;
    b: Bool;
}

contract ComboTest {
    complexField: Level3;

    init() {
        self.complexField = Level3{ l2: null, b: false };
    }
}