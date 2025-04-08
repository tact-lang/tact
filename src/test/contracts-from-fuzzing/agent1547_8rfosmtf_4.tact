struct Level2 {
    flag: Bool;
    amount: Int;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepNestedContract {
    nested: Level1;

    init() {
        self.nested = Level1 {
            l2a: Level2 { flag: true, amount: 5 },
            l2b: Level2 { flag: false, amount: 10 }
        };
    }
}