struct Leaf {
    x: Int;
}

struct Level2 {
    leaf: Leaf;
    y: Bool;
}

struct Level1 {
    inner: Level2;
    z: String;
}

contract DeepNesting {
    root: Level1;
    init() {
        self.root = Level1{
            inner: Level2{
                leaf: Leaf{x:77},
                y: false
            },
            z: "deep"
        };
    }
}