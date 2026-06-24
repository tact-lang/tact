struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    a: Inner;
    b: Inner?;
}

struct Outer {
    m: Middle;
    n: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                a: Inner{x: 1, y: true},
                b: null
            },
            n: null
        };
    }
}