struct InnerOpt {
    v: Int;
    flag: Bool;
}

struct OuterOpt {
    a: Int;
    b: InnerOpt?;
    c: String;
    d: InnerOpt?;
}

contract NestedNull {
    st: OuterOpt;

    init() {
        self.st = OuterOpt{
            a: 11,
            b: null,
            c: "nested",
            d: null
        };
    }
}