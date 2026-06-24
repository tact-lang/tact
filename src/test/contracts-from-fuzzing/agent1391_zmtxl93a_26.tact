struct Level2 {
    b: Int;
}

struct Level1 {
    a: Level2;
}

contract ShadowingNames {
    Level1: Int = 10; // intentional conflict: field has same name as struct
    l1: Level1;

    init() {
        self.l1 = Level1{ a: Level2{ b:42 } };
    }
}