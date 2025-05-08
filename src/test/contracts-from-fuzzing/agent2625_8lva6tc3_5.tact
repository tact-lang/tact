struct Outer {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    optInt: Int?;
    flag: Bool;
    text: String;
}

contract TestMultiNested {
    s: Outer;

    init() {
        self.s = Outer{
            inner1: Inner{ optInt: 10, flag: true, text: "hello" },
            inner2: Inner{ optInt: null, flag: false, text: "world" }
        };
    }
}
