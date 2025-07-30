struct Level3 {
    v1: Int;
    v2: String;
}

struct Level2 {
    sub1: Level3;
    sub2: Level3;
}

struct Level1 {
    nested: Level2;
    extra: Bool;
}

contract MultiNested {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                sub1: Level3{v1: 1, v2: "a"},
                sub2: Level3{v1: 2, v2: "b"}
            },
            extra: false
        };
    }
}