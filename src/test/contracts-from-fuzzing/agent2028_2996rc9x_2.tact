struct Level3 {
    x: Int;
    y: Int?;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    something: Level2;
    title: String;
}

contract MultiDeep {
    record: Level1;

    init() {
        self.record = Level1{
            something: Level2{
                nested: Level3{ x: 5, y: null },
                flag: false
            },
            title: "deep"
        };
    }
}
