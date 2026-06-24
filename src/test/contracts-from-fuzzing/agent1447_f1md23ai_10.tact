struct InnerMost {
    num: Int;
    flag: Bool?;
}

struct Inner {
    innerMost: InnerMost;
    txt: String;
}

struct Outer {
    inner: Inner;
    cond: Bool;
}

contract Complex {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                innerMost: InnerMost{ num: 123, flag: true },
                txt: "hello"
            },
            cond: false
        };
    }
}