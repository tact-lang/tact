struct Inner {
    x: Bool? = false;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    flag: Int = 5;
}

contract OptDefaults {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{ x: null, y: true },
            flag: 10
        };
    }
}