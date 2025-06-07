struct InnerMost {
    s: String?;
}

struct Mid {
    inner: InnerMost?;
    flag: Bool;
}

struct Outer {
    mid: Mid?;
    count: Int;
}

contract NullMaze {
    state: Outer;

    init() {
        self.state = Outer {
            mid: null,
            count: 42
        };
    }
}
