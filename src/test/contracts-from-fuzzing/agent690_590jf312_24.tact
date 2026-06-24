struct OptionalCont {
    i: Int?;
    s: String?;
    sub: SubOpt?;
}

struct SubOpt {
    a: Int;
    b: Bool?;
}

contract NestedNulls {
    s: OptionalCont;

    init() {
        self.s = OptionalCont{
            i:null,
            s:null,
            sub:null
        };
    }
}