struct InnerStr {
    a: Int;
    b: Bool;
}

struct MiddleStr {
    inner1: InnerStr;
    inner2: InnerStr;
}

struct OuterStr {
    middle: MiddleStr;
    val: Int;
    flag: Bool?;
}

contract NestedMultiStructs {
    store: OuterStr;

    init() {
        self.store = OuterStr{
            middle: MiddleStr{
                inner1: InnerStr{a:1, b:true},
                inner2: InnerStr{a:2, b:false}
            },
            val: 42,
            flag: null
        };
    }
}