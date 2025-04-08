struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    l3: Level3;
    s: String;
}

struct Level1 {
    l2: Level2;
    b: Bool?;
}

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{x: 5, y: true},
                s: "hello"
            },
            b: null
        };
    }
}