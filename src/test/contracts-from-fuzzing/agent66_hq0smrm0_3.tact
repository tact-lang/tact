struct DeepNest {
    level: Int;
    next: Inner;
}

struct Inner {
    val: Int;
    note: String;
}

contract Test {
    root: DeepNest;
    init() {
        self.root = DeepNest{
            level: 7,
            next: Inner{
                val: 99,
                note: "deep",
            },
        };
    }
}
