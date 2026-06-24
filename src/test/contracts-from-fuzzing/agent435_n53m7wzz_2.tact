struct Inner {
    x: Int;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    text: String;
    optionalInner: Inner?;
}

contract DeepTest {
    m: Middle;

    init() {
        self.m = Middle{
            inner: Inner{ x: 10, flag: false },
            text: "deep",
            optionalInner: null
        };
    }
}