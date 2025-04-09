struct NestedStructs {
    s1: Level1;
    s2: Level2;
    optS3: Level3?;
}

struct Level1 {
    x: Int;
    y: String;
}

struct Level2 {
    z: Bool;
    w: String?;
}

struct Level3 {
    a: Bool;
    b: Int;
}

contract MixedNested {
    ns: NestedStructs;

    init() {
        self.ns = NestedStructs{
            s1: Level1{ x: 1, y: "hello" },
            s2: Level2{ z: true, w: null },
            optS3: null,
        };
    }
}