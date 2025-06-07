struct Inner {
    x: Int = 7;
    y: Bool = true;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    opt: Int?;
}

contract MultiSameStructs {
    s: Outer;

    init() {
        self.s = Outer{
            inner1: Inner{
                x: 70,
                y: false
            },
            inner2: Inner{
                x: 80,
                y: true
            },
            opt: null
        };
    }
}