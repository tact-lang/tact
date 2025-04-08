struct Level3 {
    val: Int as uint8;
}

struct Level2 {
    next: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    amount: Int;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner: Level2{
                next: Level3{ val: 42 },
                flag: true,
            },
            amount: 1000,
        };
    }
}
