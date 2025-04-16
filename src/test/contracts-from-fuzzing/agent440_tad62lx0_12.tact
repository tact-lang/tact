struct InnerMost {
    x: Int;
}

struct Mid {
    inner: InnerMost;
    y: Int;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    m3: Mid;
    m4: Mid;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{ inner: InnerMost{ x: 1 }, y: 2 },
            m2: Mid{ inner: InnerMost{ x: 3 }, y: 4 },
            m3: Mid{ inner: InnerMost{ x: 5 }, y: 6 },
            m4: Mid{ inner: InnerMost{ x: 7 }, y: 8 }
        };
    }
}