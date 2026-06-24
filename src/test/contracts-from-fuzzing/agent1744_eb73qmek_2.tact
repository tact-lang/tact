struct Inner {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct Middle {
    inn: Inner;
    optStr: String?;
}

contract DeepNest {
    m: Middle;
    
    init() {
        self.m = Middle {
            inn: Inner{ f1: 1, f2: "hello", f3: true },
            optStr: null,
        };
    }
}
