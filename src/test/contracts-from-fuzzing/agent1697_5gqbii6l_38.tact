struct Inner {
    a: Int = 1;
    b: Int?;
    c: Bool? = null;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    m: Middle;
    extra: Int?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{
                in1: Inner{b: null},
                in2: Inner{}
            },
            extra: null
        };
    }
}