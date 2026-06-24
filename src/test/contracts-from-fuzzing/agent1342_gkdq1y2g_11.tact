struct BigNested {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    description: String;
}

struct Inner {
    a: Int;
    b: Int;
    c: Bool;
    s: String;
    optVal: Int?;
}

contract NestedLargeStorage {
    big: BigNested;

    init() {
        self.big = BigNested{
            inner1: Inner{ a:1, b:2, c:true, s:"x", optVal: null },
            inner2: Inner{ a:3, b:4, c:false, s:"y", optVal:5 },
            inner3: Inner{ a:6, b:7, c:true, s:"z", optVal:null },
            description: "desc"
        };
    }
}