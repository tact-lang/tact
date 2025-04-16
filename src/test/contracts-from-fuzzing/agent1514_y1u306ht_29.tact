struct TinyOpts {
    a: Int? as uint4;
    b: Int? as uint4;
    c: Int? as uint4;
}

contract Test {
    st: TinyOpts = TinyOpts{a:null,b:null,c:null};
    init() {
        self.st = TinyOpts{a:1,b:2,c:3};
    }
}