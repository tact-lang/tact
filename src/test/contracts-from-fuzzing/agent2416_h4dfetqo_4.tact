struct ComplexNested {
    x: Int = 1;
    y: Int? = null;
    z: InnerLayer;
}

struct InnerLayer {
    m: Int;
    n: Int?;
}

contract NestedOptionalDefaults {
    val: ComplexNested = ComplexNested{
        y: null,
        x: 42,
        z: InnerLayer{m: 5, n: null}
    };
}