struct Level3 {
    a: Int?; b: Int?;
    c: String?;
}
struct Level2 {
    l3a: Level3?;
    l3b: Level3?;
}
struct Level1 {
    l2: Level2?;
    note: String?;
}

contract DeepNestOptionalTest {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3a: Level3{ a: 1, b: null, c: "a" },
                l3b: null
            },
            note: null
        };
    }
}