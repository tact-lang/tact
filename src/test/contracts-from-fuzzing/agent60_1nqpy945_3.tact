struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    im: InnerMost;
    opt: Int?;
}

struct Outer {
    m: Middle;
    f: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                im: InnerMost{ a: 7, b: true },
                opt: null
            },
            f: false
        };
    }
}