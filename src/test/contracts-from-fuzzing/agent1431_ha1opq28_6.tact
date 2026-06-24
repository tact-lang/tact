struct ComplexInner {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
}

struct Middle {
    inner1: ComplexInner;
    inner2: ComplexInner;
}

contract TestContract {
    mid: Middle;

    init() {
        self.mid = Middle{
            inner1: ComplexInner{ a:1, b:null, c:true, d:false, e:"hi" },
            inner2: ComplexInner{ a:2, b:10, c:false, d:null, e:"there" }
        };
    }
}