// Deeply nested optional in optional struct
struct Level3 {
    s: String;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract NestedOptionalTest {
    s: Level1?;

    init() {
        self.s = Level1{
            nested: Level2{
                nested: Level3{
                    s: "deep"
                }
            }
        };
    }
}