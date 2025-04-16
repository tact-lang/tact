struct InnerMost {
    flag: Bool;
}

struct Inner {
    text: String;
    num: Int;
    innerMost: InnerMost;
}

struct Outer {
    outerVal: Int;
    inner: Inner;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{
            outerVal: 42,
            inner: Inner{
                text: "hi",
                num: 1,
                innerMost: InnerMost{flag:true}
            }
        };
    }

    receive() {
        self.state = self.state;
    }
}