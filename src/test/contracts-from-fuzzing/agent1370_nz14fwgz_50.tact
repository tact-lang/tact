// deeply nested struct > optional > struct > optional, in contract param
struct InnerMost {
    z: Int;
}

struct Mid {
    v: Bool;
    im: InnerMost?;
}

struct Out {
    x: Int?;
    m: Mid;
}

contract ComplexParamNest(
    o: Out? 
) {}