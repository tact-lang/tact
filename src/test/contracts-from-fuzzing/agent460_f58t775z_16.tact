struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Middle {
    flag: Bool;
    inner: Inner;
    optionalInner: Inner?;
}

contract ComplexComb {
    x: Middle = Middle{
        flag: true,
        inner: Inner{ a:1, b:null, c:"x" },
        optionalInner: null
    };

    init() {
        self.x = Middle{
            flag: false,
            inner: Inner{ a:10, b:true, c:"abc" },
            optionalInner: Inner{ a:20, b:false, c:"def" }
        };
    }
}
