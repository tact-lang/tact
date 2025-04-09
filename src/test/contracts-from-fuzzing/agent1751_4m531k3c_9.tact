struct Level3 {
    a: Int?;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    c: String?;
}

struct Level1 {
    l2: Level2;
    d: Int;
}

contract DeepNest {
    store: Level1;

    init() {
        self.store = Level1{
            l2: Level2{
                l3: Level3{
                    a: null,
                    b: true,
                },
                c: "hello",
            },
            d: 123,
        };
    }

    receive() {}
}