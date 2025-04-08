struct AllKinds {
    a: Int as uint8;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as uint32;
    f: Int as int16;
}

contract TestContract {
    s: AllKinds = AllKinds{ a:1, b:true, c:null, d:null, e:2, f:3 };

    init() {
        self.s = self.s;
    }
}