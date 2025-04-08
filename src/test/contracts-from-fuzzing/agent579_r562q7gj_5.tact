struct Level3 {
    value: Int?;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    label: String?;
}

contract NestedStorage {
    payload: Level1;

    init() {
        self.payload = Level1{
            inner: Level2{
                nested: Level3{ value: null },
                flag: true
            },
            label: null
        };
    }
}