struct Level3 { z: Bool }
struct Level2 { y: Level3 }
struct Level1 { x: Level2 }
struct Root {
    a: Level1;
    b: Int;
    c: Bool?;
    d: String;
}

contract TestContract {
    storage: Root;

    init() {
        self.storage = Root{
            a: Level1{ x: Level2{ y: Level3{ z: true } } },
            b: 100,
            c: null,
            d: "Hello"
        };
    }
}