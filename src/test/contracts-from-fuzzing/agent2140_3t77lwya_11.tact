struct BigOuter {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
    s: String?;
}

contract ManyNested {
    big: BigOuter;
    init() {
        self.big = BigOuter{
            inner1: Inner{ foo: 1, bar: false, s: null },
            inner2: Inner{ foo: 2, bar: true, s: "hello" },
            inner3: Inner{ foo: 3, bar: false, s: null },
        };
    }
}
