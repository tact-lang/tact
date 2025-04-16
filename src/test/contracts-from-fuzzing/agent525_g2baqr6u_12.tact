struct Rec1 {
    a: Int;
    b: String;
}

struct Rec2 {
    rec1: Rec1;
    bOpt: Bool?;
    strOpt: String?;
}

contract RecTest {
    f: Rec2;

    init() {
        self.f = Rec2{
            rec1: Rec1{a:5, b:"hi"},
            bOpt: null,
            strOpt: "hello"
        };
    }
}
