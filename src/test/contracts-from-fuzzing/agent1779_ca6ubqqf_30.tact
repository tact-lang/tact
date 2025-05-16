struct OptBoolStr {
    a: Bool?;
    b: String?;
}

struct Wrap {
    c: Int;
    x: OptBoolStr;
}

contract OptInNested {
    s: Wrap;
    init() {
        self.s = Wrap{c:123, x:OptBoolStr{a:null, b:null}};
    }
}