struct Level3 { val: Int }

struct Level2 { inner: Level3 }

struct Level1 { inner: Level2 }

contract DeeplyNested {
    val: Level1;

    init() {
        self.val = Level1{ inner: Level2{ inner: Level3{ val: 123 } } };
    }
}