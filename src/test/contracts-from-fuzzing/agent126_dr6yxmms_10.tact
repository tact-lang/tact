struct Level3 {
    flag: Bool;
    amount: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2?;
}

contract OptionalMidLayer {
    root: Level1;

    init() {
        self.root = Level1{
            nested: Level2{
                inner: Level3{
                    flag: true,
                    amount: 5
                }
            }
        };
    }
}