struct Outer {
    s: Inner;
    flag: Bool;
}

struct Inner {
    opt: InnerMost?;
    count: Int;
}

struct InnerMost {
    note: String?;
    isOk: Bool;
}

contract DeepOptionalNest {
    val: Outer;
    init() {
        self.val = Outer{
            s: Inner{ opt: null, count: 1 },
            flag: true
        };
    }
}