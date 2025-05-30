struct Sub {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
}

contract InnerComplex {
    s: Sub;

    init() {
        self.s = Sub{ a:1, b:true, c:null, d:"hi" };
    }
}