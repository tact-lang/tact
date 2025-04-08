struct OptInner {
    innerVal1: Int?;
    innerVal2: Bool?;
}

struct ComplexOptStruct {
    val1: Int;
    val2: OptInner?;
    val3: Bool?;
}

contract OptStructs {
    field: ComplexOptStruct;

    init() {
        self.field = ComplexOptStruct{
            val1: 1,
            val2: null,
            val3: null
        };
    }
}