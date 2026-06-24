struct Inner {
    x: Int = 1;
}

struct Outer {
    optInner: Inner?;
}

contract OptStruct {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: null
        };
    }
}