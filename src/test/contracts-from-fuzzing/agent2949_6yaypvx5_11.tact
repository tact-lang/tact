struct Level1 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    x: Level1;
    y: String?;
}

struct Level3 {
    nested: Level2;
    flag: Bool;
}

contract OptionalDeep {
    val: Level3;

    init() {
        self.val = Level3{
            nested: Level2{
                x: Level1{ a: 5, b: null },
                y: null
            },
            flag: true
        };
    }
}
