struct S {
    a: Int;
    b: Int;
}
contract ManyStructs {
    sa: S;
    sb: S;
    sc: S;
    sd: S;
    init() {
        self.sa = S{a:1,b:2};
        self.sb = S{a:3,b:4};
        self.sc = S{a:5,b:6};
        self.sd = S{a:7,b:8};
    }
}