struct InnerMost {
    flag: Bool;
}

struct Inner {
    opt: InnerMost?;
}

struct Outer {
    m: Inner?;
    n: Inner?;
}

contract DeepNulls {
    root: Outer;

    init() {
        self.root = Outer{
            m:null,
            n:null
        };
    }
}