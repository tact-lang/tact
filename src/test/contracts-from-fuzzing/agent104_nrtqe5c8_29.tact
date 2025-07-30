struct InnerPrimitive {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterNested {
    in1: InnerPrimitive;
    in2: InnerPrimitive;
    optionalInner: InnerPrimitive?;
}

contract StructDupNestedOpt {
    state: OuterNested;
    init() {
        self.state = OuterNested{
            in1: InnerPrimitive{a:1,b:true,c:"x"},
            in2: InnerPrimitive{a:2,b:false,c:"y"},
            optionalInner: null
        };
    }
}