struct Level2 {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Level1 {
    l2: Level2?;
    d: String;
    e: Int;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: null,
            d: "hi",
            e: 5,
        };
    }
}