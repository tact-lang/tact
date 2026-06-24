struct LargeNestedOptional {
    p1: Int?;
    p2: Level1?;
}

struct Level1 {
    p3: Int;
    p4: Level2?;
}

struct Level2 {
    p5: String;
    p6: Bool?;
}

contract TestLargeNestedOptional {
    data: LargeNestedOptional;
    init() {
        self.data = LargeNestedOptional{
            p1: null,
            p2: null
        };
    }
}
