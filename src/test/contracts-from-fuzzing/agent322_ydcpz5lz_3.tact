struct InnerMost {
    a: Bool;
    b: Int;
    c: String;
}

struct Middle {
    im1: InnerMost;
    im2: InnerMost;
    im3: InnerMost;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            m1: Middle{
                im1: InnerMost{a: true, b: 1, c: "x"},
                im2: InnerMost{a: false, b: 2, c: "y"},
                im3: InnerMost{a: true, b: 3, c: "z"},
            },
            m2: Middle{
                im1: InnerMost{a: false, b: 4, c: "p"},
                im2: InnerMost{a: true, b: 5, c: "q"},
                im3: InnerMost{a: false, b: 6, c: "r"},
            },
        };
    }
}