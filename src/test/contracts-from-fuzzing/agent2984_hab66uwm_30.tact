struct Complex {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    nested: NestedStruct;
}

struct NestedStruct {
    nInt: Int;
    nOpt: Int?;
}

contract Test31 {
    data: Complex;
    init() {
        self.data = Complex{
            intVal:1,
            boolVal:false,
            optInt:null,
            optBool:true,
            nested: NestedStruct{ nInt:3, nOpt:null }
        };
    }
}
