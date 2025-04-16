struct Level2 { x: Int; y: Bool }
struct Level1 { nested: Level2; flag: Bool }

contract NestedContract {
    stored: Level1;

    init() {
        self.stored = Level1{ nested: Level2{ x: 7, y: false }, flag: true };
    }
}