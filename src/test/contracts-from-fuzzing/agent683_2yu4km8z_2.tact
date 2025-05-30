struct Inner {
    flag: Bool;
    text: String;
    num: Int?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optionalInner: Inner?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ flag: true, text: "abc", num: null },
            inner2: Inner{ flag: false, text: "def", num: 42 },
            optionalInner: null
        };
    }
}