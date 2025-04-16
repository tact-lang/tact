// Test large nesting and many optionals
struct LVL4 {
    x: Int?;
    y: String?;
}

struct LVL3 {
    inner: LVL4?;
    b: Bool?;
}

struct LVL2 {
    inner: LVL3?;
    s: String;
}

struct LVL1 {
    inner: LVL2?;
    i: Int;
}

contract BigNestOption {
    root: LVL1;
    init() {
        self.root = LVL1 {
            inner: LVL2 {
                inner: LVL3 {
                    inner: LVL4 { x: null, y: null },
                    b: null
                },
                s: "foo"
            },
            i: 42
        };
    }

    receive() {}
}