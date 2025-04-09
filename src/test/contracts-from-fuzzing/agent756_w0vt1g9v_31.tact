struct Leaf {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Level2 {
    x: Leaf?;
    y: Leaf?;
}

struct Level1 {
    l2a: Level2?;
    l2b: Level2?;
}

contract DeepOptionalNest {
    deep: Level1;
    init() {
        self.deep = Level1{
            l2a: Level2{
                x: null,
                y: null
            },
            l2b: null
        };
    }
}