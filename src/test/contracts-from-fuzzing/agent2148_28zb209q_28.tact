struct Wrapped {
    inner: InnerStruct;
}

struct InnerStruct {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract Cont {
    f: Wrapped;
    init() {
        self.f = Wrapped{
            inner: InnerStruct{
                intVal: 5,
                boolVal: true,
                strVal: "H"
            }
        };
    }
}