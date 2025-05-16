struct InnerMost {
    a: Int = 1;
    b: Bool = true;
}

struct Mid {
    x: String = "hi";
    y: InnerMost;
    z: Int?;
}

struct Outer {
    p: Int = 42;
    q: Mid;
}

contract DeepNest {
    s: Outer = Outer {
        q: Mid { y: InnerMost {}, z: null }
    };

    init() {
        self.s = Outer {
            p: 100,
            q: Mid {
                x: "world",
                y: InnerMost { a: 7, b: false },
                z: null
            }
        };
    }

    receive() {}
}