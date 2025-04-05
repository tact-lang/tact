struct InnerOpt {
    x: Int?;
    y: Int;
}

struct OuterComplex {
    inner: InnerOpt;
    values: map<Int, Int>;
    z: Int?;
}

contract TestComplexNestedFixed {
    receive() {
        let complex: OuterComplex = OuterComplex {
            inner: InnerOpt { x: null, y: 111 },
            values: emptyMap(),
            z: null
        };
        complex.values.set(5, 55);
        return;
    }
}
