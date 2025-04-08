struct Inner {
    flag: Bool = false;
    count: Int = 0;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedStructTest {
    payload: Outer = Outer{
        inner1: Inner{ flag: true, count: 5 },
        inner2: Inner{ flag: false, count: 10 }
    };

    init() {
        self.payload = Outer{
            inner1: Inner{ flag: true, count: 50 },
            inner2: Inner{ flag: true, count: 100 }
        };
    }
}