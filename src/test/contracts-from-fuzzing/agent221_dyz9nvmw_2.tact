struct InnerMost {
    z: Int?;
}

struct Inner {
    y: InnerMost;
    x: Int?;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract ChainNested {
    value: Outer;

    init() {
        self.value = Outer{
            a: 123,
            b: Inner{
                y: InnerMost{z: null},
                x: null
            }
        };
    }
}
