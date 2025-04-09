struct InnerX {
    s: String;
    opt: Int?;
}

struct MiddleX {
    a: Int;
    b: InnerX;
}

struct OuterX {
    val: MiddleX;
}

contract ExtraNestedStructs {
    top: OuterX;

    init() {
        self.top = OuterX{ val: MiddleX{ a:1, b: InnerX{ s:"s", opt:null } } };
    }
}
