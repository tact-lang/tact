struct Level3 {
    flag: Bool;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    wrapper: Level2;
}

contract OptionalDeep {
    storage: Level1;

    init() {
        self.storage = Level1{
            wrapper: Level2{
                inner: Level3{ flag: true }
            }
        };
    }
}