struct Level3 { deep: String?; }
struct Level2 { nested: Level3; }
struct Level1 { inner: Level2; }

contract DeepNest {
    store: Level1;

    init() {
        self.store = Level1{ inner: Level2{ nested: Level3{} } };
    }
}