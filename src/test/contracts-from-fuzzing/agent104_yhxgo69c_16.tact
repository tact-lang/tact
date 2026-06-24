struct Level2 {
    innerValue: Int;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract TestContract {
    storage: Level1;
    init() {
        self.storage = Level1{
            nested: Level2{ innerValue: 77 },
            flag: true
        };
    }
}