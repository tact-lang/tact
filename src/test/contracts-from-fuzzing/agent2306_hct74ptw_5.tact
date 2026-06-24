struct InnerMost { x: Int; }

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract MultiLevel {
    storage: Outer;

    init() {
        self.storage = Outer {
            mid: Middle {
                inner: InnerMost { x: 777 }
            }
        };
    }
}
