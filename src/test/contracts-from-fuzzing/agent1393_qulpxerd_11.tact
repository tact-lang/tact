// deeply nested with optionals in every level
struct Level3 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    x: Level3?;
    y: String?;
}

struct Level1 {
    q: Level2?;
    z: Int;
}

contract NestedOptionalsTest {
    complex: Level1;

    init() {
        self.complex = Level1{
            q: Level2{
                x: Level3{
                    a: null,
                    b: null,
                },
                y: null,
            },
            z: 123
        };
    }
}
