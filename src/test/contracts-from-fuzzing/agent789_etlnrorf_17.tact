struct Level1 { a: Int; }
struct Level2 { b: Bool; }
struct Level3 { s1: Level1; s2: Level2; }

contract NestedStructMix {
    nested: Level3;
    init() {
        self.nested = Level3{
            s1: Level1{a: 21},
            s2: Level2{b: true}
        };
    }
}