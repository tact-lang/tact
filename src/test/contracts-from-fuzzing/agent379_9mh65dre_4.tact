struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    c: String;
}

struct Level1 {
    l2: Level2;
    d: Int;
}

contract DeepNestedStruct {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    a: 1,
                    b: true,
                },
                c: "text",
            },
            d: 42,
        };
    }
}