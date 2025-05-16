struct Level3 { a: Int; b: Bool; }
struct Level2 { l3a: Level3; l3b: Level3; }
struct Level1 { l2: Level2; x: Int; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3a: Level3{ a: 1, b: true },
                l3b: Level3{ a: 2, b: false }
            },
            x: 99
        };
    }
}