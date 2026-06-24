struct Level3 {
    val: Int;
}

struct Level2 {
    sub: Level3;
    another: Int;
}

struct Level1 {
    nested: Level2;
    optionalSub: Level3?;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                sub: Level3{ val: 1 },
                another: 2,
            },
            optionalSub: null,
        };
    }
}
