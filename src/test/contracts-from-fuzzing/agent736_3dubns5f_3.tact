struct DeeplyNested {
    val: Int;
    more: Level2;
}

struct Level2 {
    yes: Bool;
    leaf: Leaf;
}

struct Leaf {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepNestingTest {
    s: DeeplyNested;

    init() {
        self.s = DeeplyNested{
            val: 5,
            more: Level2{
                yes: true,
                leaf: Leaf{ a: 1, b: false, c: "leaf" }
            }
        };
    }
}