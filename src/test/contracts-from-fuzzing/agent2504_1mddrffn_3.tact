struct Level3 {
    leaf: Int;
    optLeaf: Bool?;
}

struct Level2 {
    sub: Level3;
    s: String;
}

struct Level1 {
    mid: Level2;
    addr: Address?;
}

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            mid: Level2{
                sub: Level3{leaf: 7, optLeaf: null},
                s: "deep"
            },
            addr: null
        };
    }
}
