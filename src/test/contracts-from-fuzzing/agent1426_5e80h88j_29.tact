// Deeply nested struct with many optional nested fields
struct Level3 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    l3a: Level3?;
    l3b: Level3?;
}

struct Level1 {
    l2a: Level2?;
    l2b: Level2?;
}

contract DeepOptNest {
    s: Level1;

    init() {
        self.s = Level1{
            l2a: null,
            l2b: Level2{
                l3a: Level3 { a: null, b: true },
                l3b: null
            }
        };
    }
}