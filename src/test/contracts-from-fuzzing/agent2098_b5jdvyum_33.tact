struct ComplexNested {
    a: Int;
    b: Int?;
    c: InnerNested;
}

struct InnerNested {
    foo: Int;
    bar: Bool?;
}

contract ComplexStorage {
    val: ComplexNested = ComplexNested{
        a:1,
        b:null,
        c:InnerNested{foo:42, bar:true}
    };
}
