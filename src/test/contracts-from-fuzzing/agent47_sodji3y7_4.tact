struct Level2 { x: Int?; y: Bool?; }

struct Level1 { inner: Level2; z: Int; }

contract TestContract {
    complex: Level1;

    init() {
        self.complex = Level1{
            inner: Level2{ x: null, y: false },
            z: 99,
        };
    }
}