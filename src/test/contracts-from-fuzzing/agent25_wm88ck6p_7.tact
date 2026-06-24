struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{
                    a: 5,
                    b: null,
                },
            },
        };
    }
}