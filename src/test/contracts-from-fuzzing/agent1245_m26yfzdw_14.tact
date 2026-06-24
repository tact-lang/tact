struct Mid {
    x: Int;
    y: Int;
}

struct Outer {
    inner1: Mid;
    inner2: Mid;
    num: Int;
}

contract TestPersist {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Mid{ x: 10, y: 20 },
            inner2: Mid{ x: 30, y: 40 },
            num: 50,
        };
    }
}
