struct OptWrap {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct DoubleWrap {
    x: Int;
    opt: OptWrap;
}

contract Test {
    f: DoubleWrap;

    init() {
        self.f = DoubleWrap{ x:1, opt: OptWrap{ a:null, b:null, c:null } };
    }
}