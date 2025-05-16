struct Level2 { b: Int; }
struct Level1 { a: Level2; }

contract OverrideDefaultsTest {
    data: Level1;

    init() {
        self.data = Level1{ a: Level2{ b: 123 } };
    }
}