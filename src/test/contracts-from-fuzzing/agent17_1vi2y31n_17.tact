struct Level3 { x: Int }
struct Level2 { inner: Level3 }
struct Level1 { inner: Level2 }

contract DeepFour {
    val: Level1;

    init() {
        self.val = Level1{ inner: Level2{ inner: Level3{ x: 99 } } };
    }
}