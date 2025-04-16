struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    x: Inner;
    y: Inner?;
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
                x: Inner{a: 1, b: null},
                y: null
            },
            n: null
        };
    }
}