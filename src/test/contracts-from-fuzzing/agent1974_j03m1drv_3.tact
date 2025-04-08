struct Level1 { inner: Int; optional: Int?; }
struct Level2 { nested1: Level1; nested2: Level1; }
struct Level3 { tuple1: Level2; val: Int; }

contract TestStorage {
    storageField: Level3;

    init() {
        self.storageField = Level3{
            tuple1: Level2{
                nested1: Level1{ inner: 1, optional: null },
                nested2: Level1{ inner: 2, optional: null }
            },
            val: 42
        };
    }
}
