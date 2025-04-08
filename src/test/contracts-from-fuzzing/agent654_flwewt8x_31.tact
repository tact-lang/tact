struct Mixed {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool?;
    f: String?;
}

contract TestContract {
    m: Mixed;
    init() {
        self.m = Mixed{
            a:1,b:null,c:null,d:2,e:null,f:null
        };
    }
}