struct Level3 {
    f3: Bool;
}

struct Level2 {
    f2: Int;
    next: Level3;
}

struct Level1 {
    f1: Address;
    next: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            f1: myAddress(),
            next: Level2{
                f2: 42,
                next: Level3{
                    f3: true
                }
            }
        };
    }
}