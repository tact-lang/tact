// Test multiple nested structs with optionals and defaults
struct Level3 {
    p: Int = 99;
    q: Bool?;
}

struct Level2 {
    inner: Level3?;
    s: String = "deep";
}

struct Level1 {
    nested: Level2;
}

contract StorageTest {
    test: Level1;

    init() {
        self.test = Level1{
            nested: Level2 {
                inner: Level3{
                    p: 88,
                    q: null
                },
                s: "deepest"
            }
        };
    }
}