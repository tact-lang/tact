struct ComplexStruct {
    optInt: Int?;
    boolVal: Bool;
    textOpt: String?;
    nestedOpt: OptionalInner?;
}

struct OptionalInner {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldTest {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            optInt: null,
            boolVal: true,
            textOpt: null,
            nestedOpt: OptionalInner{foo:1, bar:false}
        };
    }
}