struct Level3 { c: Int; d: Bool; }
struct Level2 { x: Int; y: Level3; }
struct Level1 { a: Bool; b: Level2; }

contract NestedPersistent {
    nested: Level1;

    init() {
        self.nested = Level1{
            a: true,
            b: Level2{
                x: 42,
                y: Level3{ c: 7, d: false }
            }
        };
    }
}