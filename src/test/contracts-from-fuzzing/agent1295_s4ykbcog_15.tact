// Test nested structs with many optional fields on each level
struct Level3 {
    f1: Int?;
    f2: Bool?;
}

struct Level2 {
    nested: Level3?;
    s: String?;
}

struct Level1 {
    foo: Level2?;
    addr: Address?;
}

contract OptContract {
    data: Level1?;

    init() {
        self.data = Level1{
            foo: Level2{
                nested: Level3{
                    f1: 42,
                    f2: null
                },
                s: null
            },
            addr: null
        };
    }
}