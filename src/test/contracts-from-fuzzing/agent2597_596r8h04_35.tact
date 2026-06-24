struct Leaf1 {
    x: Int;
}

struct Leaf2 {
    y: String;
}

struct Middle {
    a: Leaf1;
    b: Leaf2;
}

struct Root {
    m: Middle;
    z: Bool;
}

contract MultiBranch {
    storage: Root;

    init() {
        self.storage = Root{
            m: Middle{
                a: Leaf1{x: 2},
                b: Leaf2{y: "hi"},
            },
            z: true,
        };
    }
}