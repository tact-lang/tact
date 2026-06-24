struct Level1 { a: Int; b: Bool; }
struct Level2 { l1: Level1; c: String; }
struct Level3 { l2: Level2; d: Int?; }
contract FlatDeep {
    field: Level3;
    init() {
        self.field = Level3{
            l2: Level2{ l1: Level1{ a:1, b:true }, c: "a" },
            d: null
        };
    }
}