struct Level3 { deep: Int }
struct Level2 { nested: Level3 }
struct Level1 { inner: Level2 }

contract DeeplyNested {
    lvl: Level1;

    init() {
        self.lvl = Level1{ inner: Level2{ nested: Level3{ deep: 42 } } };
    }
}
