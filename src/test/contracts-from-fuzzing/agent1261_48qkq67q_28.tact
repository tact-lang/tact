struct ComposeA {
    a: Int;
    b: Bool?;
}

struct ComposeB {
    x: String?;
    y: Int;
}

struct ComposeAll {
    ca: ComposeA;
    cb: ComposeB;
    val: Int;
}

contract NestedComposed {
    data: ComposeAll;

    init() {
        self.data = ComposeAll{
            ca: ComposeA{ a: 1, b: null },
            cb: ComposeB{ x: null, y: 2 },
            val: 3
        };
    }
}