struct Level3 {
    a: Bool?; 
    b: Int;
}

struct Level2 {
    l3: Level3;
    s: String?;
}

struct Level1 {
    l2: Level2;
    x: Int;
}

contract DeepNesting {
    nested: Level1 = Level1{
        l2: Level2{
            l3: Level3{ a: null, b: 7 },
            s: null
        },
        x: 123
    };

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ a: true, b: 42 },
                s: "deep"
            },
            x: 456
        };
    }

    receive() {}
}