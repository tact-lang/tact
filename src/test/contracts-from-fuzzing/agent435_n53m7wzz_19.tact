struct InnerStr {
    a: Int;
    b: Bool;
    s: String;
}

struct MidStr {
    inner: InnerStr;
    opt: Bool?;
}

struct OuterStr {
    mid: MidStr;
    txt: String;
}

contract NestedStruct3 {
    outer: OuterStr;

    init() {
        self.outer = OuterStr{
            mid: MidStr{ inner: InnerStr{ a:1, b:true, s:"x" }, opt: false },
            txt: "outer"
        };
    }
}