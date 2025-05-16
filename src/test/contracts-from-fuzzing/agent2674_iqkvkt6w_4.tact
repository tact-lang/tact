struct Level1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Level2 {
    nested: Level1;
    d: Bool;
}

struct Level3 {
    nested2: Level2;
    e: String;
}

struct Level4 {
    nested3: Level3;
    f: Bool;
}

contract FourLayerNestedStructTest {
    nestedAll: Level4;

    init() {
        self.nestedAll = Level4{
            nested3: Level3{
                nested2: Level2{
                    nested: Level1{
                        a: 1,
                        b: false,
                        c: "hi",
                    },
                    d: true,
                },
                e: "deep",
            },
            f: false,
        };
    }
}