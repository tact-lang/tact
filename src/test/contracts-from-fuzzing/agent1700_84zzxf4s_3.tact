struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Inner {
    innerMost: InnerMost;
    num: Int;
}

struct Outer {
    inner: Inner;
    enabled: Bool;
}

contract TestDeepOptional {
    data: Outer?;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    val: 10,
                    flag: true
                },
                num: 5
            },
            enabled: false
        };
    }
}
