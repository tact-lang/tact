struct InnerMost {
    a: Int;
    b: Bool;
}

struct Mid {
    inner: InnerMost;
    s: String;
}

struct Outer {
    m: Mid;
    addr: Address?;
}

contract Test15 {
    val: Outer;
    init() {
        self.val = Outer{
            m: Mid{
                inner: InnerMost{a:5,b:false},
                s: "X"
            },
            addr: null
        };
    }
}