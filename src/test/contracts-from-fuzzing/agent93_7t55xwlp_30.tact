struct ComplexInner {
    a: Int;
    b: Bool?;
    c: String;
}

struct ComplexOuter {
    x: Int?;
    y: String?;
    z: ComplexInner;
}

contract ComplexNested {
    data: ComplexOuter = ComplexOuter{
        x: null,
        y: null,
        z: ComplexInner{ a: 7, b: null, c: "hello" }
    };
}