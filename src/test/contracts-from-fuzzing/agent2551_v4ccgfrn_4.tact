struct Level3 {
    alive: Bool;
}

struct Level2 {
    l3: Level3;
    comment: String;
}

struct Level1 {
    l2: Level2;
    count: Int;
}

contract DeepNestedStructField {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{alive: true},
                comment: "deep"
            },
            count: 42
        };
    }
}