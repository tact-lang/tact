struct InnerMost {
    flag: Bool;
}

struct Inner {
    opt: InnerMost?;
}

struct Outer {
    nested: Inner;
    count: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                opt: InnerMost{
                    flag: true
                }
            },
            count: 42
        };
    }

    receive() {
        let _ = self.data.count;
    }
}