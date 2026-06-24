struct Level3 {
    leaf: Int = 7;
}

struct Level2 {
    inner: Level3 = Level3{};
}

struct Level1 {
    node: Level2 = Level2{};
}

contract DeepNested {
    root: Level1 = Level1{};

    init() {
        self.root = Level1{node: Level2{inner: Level3{leaf: 42}}};
    }

    receive() {
        let _ = self.root.node.inner.leaf;
    }
}