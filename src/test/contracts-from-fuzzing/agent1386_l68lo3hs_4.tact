struct Inner {
    foo: Int = 7;
    bar: Bool?;
}

struct Middle {
    inner: Inner = Inner{};
}

struct Outer {
    mid: Middle = Middle{};
}

contract Test {
    state: Outer = Outer{};
    init() {
        self.state = Outer{
            mid: Middle{
                inner: Inner{
                    foo: 42,
                    bar: true
                }
            }
        };
    }
}