struct Level3 { val: Int }
struct Level2 { inner: Level3 }
struct Level1 { inner: Level2 }

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{ inner: Level2{ inner: Level3{ val: 42 } } };
    }
}