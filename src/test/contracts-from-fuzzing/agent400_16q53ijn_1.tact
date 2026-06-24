struct Level3 {
    d: Bool;
}

struct Level2 {
    c: Int;
    l3: Level3;
}

struct Level1 {
    b: String;
    l2: Level2;
}

contract NestedStructTest {
    nested: Level1 = Level1 {
        b: "hi",
        l2: Level2 {
            c: 7,
            l3: Level3 { d: true }
        }
    };

    init() {}
}