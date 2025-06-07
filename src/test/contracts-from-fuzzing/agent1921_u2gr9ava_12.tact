struct Level3 { deep: String? = null; }
struct Level2 { nested: Level3 = Level3{}; }
struct Level1 { inner: Level2 = Level2{}; }

contract DeepNestDefaults {
    store: Level1 = Level1{};
}