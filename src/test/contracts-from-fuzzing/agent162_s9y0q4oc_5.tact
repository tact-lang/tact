struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepContract {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: Inner{
                    x: 999
                }
            }
        };
    }
}