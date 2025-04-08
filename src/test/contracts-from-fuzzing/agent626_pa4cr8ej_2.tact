struct Level3 {
    val: Int;
}

struct Level2 {
    sub: Level3;
}

struct Level1 {
    sub: Level2;
}

contract MultiLevel {
    nested: Level1;

    init() {
        self.nested = Level1{
            sub: Level2{
                sub: Level3{ val: 42 }
            }
        };
    }
}