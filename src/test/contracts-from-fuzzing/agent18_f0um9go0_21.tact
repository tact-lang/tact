struct FlatNested {
    a: Int;
    b: Bool?;
    c: String;
    d: FlatNestedInner;
}

struct FlatNestedInner {
    e: Int?;
    f: Bool;
}

contract NestedStructDemo {
    val: FlatNested;
    init() {
        self.val = FlatNested{
            a:1, b:null, c:"str", d:FlatNestedInner{ e:2, f:true }
        };
    }
}
