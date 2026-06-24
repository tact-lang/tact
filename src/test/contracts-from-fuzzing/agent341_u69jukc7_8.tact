struct InnerMost {
    k1: Bool;
    k2: Int;
}

struct Inner {
    m: InnerMost;
    txt: String;
    optInt: Int?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    f: Outer;

    init() {
        self.f = Outer{
            nested: Inner{
                m: InnerMost{ k1:true, k2:9 },
                txt: "deep",
                optInt: null
            },
            flag: false
        };
    }
}