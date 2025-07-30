struct Wrapped {
    x: Int;
}

struct Outer {
    inner1: Wrapped;
    inner2: Wrapped;
    inner3: Wrapped;
}

contract TestContract {
    d: Outer;

    init() {
        self.d = Outer{
            inner1: Wrapped{ x: 1 },
            inner2: Wrapped{ x: 2 },
            inner3: Wrapped{ x: 3 }
        };
    }
}