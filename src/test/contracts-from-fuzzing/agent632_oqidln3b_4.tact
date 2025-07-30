struct InnerMost {
    flag: Bool;
    val: Int;
}

struct Inner {
    im: InnerMost;
    b: Bool;
}

struct Middle {
    inr: Inner;
    s: String;
}

struct Outer {
    mid: Middle;
    a: Int;
}

contract TestContract {
    deepNested: Outer;
    
    init() {
        self.deepNested = Outer{
            mid: Middle{
                inr: Inner{
                    im: InnerMost{ flag: true, val: 5 },
                    b: false
                },
                s: "Deep"
            },
            a: 10
        };
    }
}