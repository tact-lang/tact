struct NestedBool {
    a: Bool;
    b: InnerBool;
}

struct InnerBool {
    c: Bool;
    d: Bool;
}

contract BoolNested {
    data: NestedBool = NestedBool{
        a:false,
        b:InnerBool{c:true,d:false}
    };
    init() {}
}