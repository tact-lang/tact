struct Level3 {
    c: Int?;
}

struct Level2 {
    b: Level3?;
}

struct Level1 {
    a: Level2?;
}

contract DeepOptionalTest {
    data: Level1;

    init() {
        self.data = Level1{ a: null };
    }
}