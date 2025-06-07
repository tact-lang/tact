struct InnerX {
    foo: Bool;
}

struct OuterX {
    a: Int;
    b: InnerX;
    c: Bool;
}

contract Around {
    val: OuterX = OuterX{ a:1, b:InnerX{foo:true}, c:false };
}