struct Topmost {
    a: Int;
    b: Bool;
}

struct Middle1 {
    inner: Topmost;
}

struct Middle2 {
    inner: Topmost;
}

struct Upper {
    m1: Middle1;
    m2: Middle2;
}

contract Complex {
    field: Upper;

    init() {
        self.field = Upper{
            m1: Middle1{ inner: Topmost{ a: 1, b: true } },
            m2: Middle2{ inner: Topmost{ a: 2, b: false } }
        };
    }
}