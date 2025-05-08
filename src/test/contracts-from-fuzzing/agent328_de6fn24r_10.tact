struct DeepTree {
    left: Int;
    right: Int;
    sub: SubTree?;
}

struct SubTree {
    leaf1: Int;
    leaf2: Int;
}

contract Test {
    dt: DeepTree;
    init() {
        self.dt = DeepTree{
            left: 1,
            right: 2,
            sub: SubTree{ leaf1:3, leaf2:4 }
        };
    }
}