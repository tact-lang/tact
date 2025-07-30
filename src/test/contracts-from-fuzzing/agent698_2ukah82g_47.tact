struct Several {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
    d: Bool;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    s1: Several;

    init() {
        self.s1 = Several{
            a:100, b:-100, c:250, d:true, e:null, f:false
        };
    }
}