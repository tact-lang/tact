struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Inner {
    innermost: InnerMost;
    text: String;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{
                innermost: InnerMost{
                    val: 42,
                    flag: true,
                },
                text: "init",
            },
            count: 7,
        };
    }

    receive() {
        self.data = Outer{
            inner: Inner{
                innermost: InnerMost{
                    val: 43,
                    flag: false,
                },
                text: "receive",
            },
            count: 8,
        };
    }
}