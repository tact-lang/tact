struct Level3 {
    flag: Bool;
    note: String;
}

struct Level2 {
    amount: Int?;
    inner: Level3;
}

struct Level1 {
    timestamp: Int;
    data: Level2;
}

contract DeepNestedStorage {
    nested: Level1;

    init() {
        self.nested = Level1{
            timestamp: 42,
            data: Level2{
                amount: null,
                inner: Level3{
                    flag: false,
                    note: "deep",
                }
            }
        };
    }
}
