struct Leaf3 {
    z: Int;
}

struct Leaf2 {
    y: Leaf3;
}

struct Leaf1 {
    x: Leaf2;
}

contract Deep3Levels {
    root: Leaf1;

    init() {
        self.root = Leaf1 {
            x: Leaf2{
                y: Leaf3{z: 77}
            }
        };
    }
}