struct S {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    opt: S?;

    init() {
        self.opt = S{
            a:null, b:null, c:null, d:null, e:42
        };
    }
}