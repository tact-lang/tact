struct InnerOpt {
    q: Int?;
}

struct ComplexOptional {
    addrOpt: Address?;
    sliceOpt: Slice?;
    nestedOpt: InnerOpt?;
}

contract NullableTypesTest {
    s: ComplexOptional;

    init() {
        self.s = ComplexOptional{
            addrOpt: null,
            sliceOpt: null,
            nestedOpt: InnerOpt{ q: 123 }
        };
    }
}