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
    data: Level1;

    init() {
        self.data = Level1{
            sub: Level2{
                sub: Level3{val: 123}
            }
        };
    }
}