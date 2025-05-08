struct SInner {
    f: Int;
    g: Bool;
}

contract ArrangedFields {
    a: Int;
    b: SInner;
    c: String;
    d: Bool;
    e: SInner;

    init() {
        self.a = 1;
        self.b = SInner{f:2,g:true};
        self.c = "test";
        self.d = false;
        self.e = SInner{f:3,g:false};
    }
}