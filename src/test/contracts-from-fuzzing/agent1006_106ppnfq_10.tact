struct Inner {
    f1: Int;
    f2: String;
}

struct Mid {
    i1: Inner;
    i2: Inner;
    b: Bool;
}

struct Outer {
    m: Mid;
    s: String;
    optMid: Mid?;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            m: Mid{ i1: Inner{f1:1,f2:"a"}, i2: Inner{f1:2,f2:"b"}, b:true },
            s:"hi",
            optMid: null
        };
    }
}
