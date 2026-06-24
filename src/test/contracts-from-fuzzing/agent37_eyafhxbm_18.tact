struct Inner {
    i: Int;
    s: String;
}

struct Middle {
    b: Bool;
    inner: Inner;
}

struct Outer {
    m: Middle;
    optStr: String?;
    optInt: Int?;
}

contract TestContract {
    big: Outer = Outer{
        m: Middle{b:true, inner:Inner{i:1,s:"s"}},
        optStr:null,
        optInt:null
    };

    init() {
        self.big = Outer{
            m: Middle{b:false, inner:Inner{i:2,s:"t"}},
            optStr:"abc",
            optInt:42
        };
    }
    receive() {}
}