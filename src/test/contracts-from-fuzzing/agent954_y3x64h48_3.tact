struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
    y: Bool;
}

struct Level1 {
    l2: Level2;
    z: String;
}

contract DeeplyNested {
    nested: Level1 = Level1{
        l2: Level2{
            l3: Level3{x: 100},
            y: true
        },
        z: "ok"
    };

    init() {}
}