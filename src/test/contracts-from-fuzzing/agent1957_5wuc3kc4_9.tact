struct InnerMost {
    d: Int;
}

struct Level2 {
    c: InnerMost?;
}

struct Level1 {
    b: Level2?;
}

struct Root {
    a: Level1?;
}

contract DeepOptionals {
    root: Root;

    init() {
        self.root = Root{ a: null };
    }
}