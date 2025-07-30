struct InnerMost {
    b: Bool;
}

struct Inner {
    im: InnerMost;
    s: String;
}

struct Middle {
    inr: Inner;
    n: Int;
}

struct Outer {
    mid: Middle;
    flag: Bool;
}

contract ManyLayer {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Middle{
                inr: Inner{
                    im: InnerMost{b:true},
                    s: "s"
                },
                n: 4
            },
            flag: false
        };
    }
}