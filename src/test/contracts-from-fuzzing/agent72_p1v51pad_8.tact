struct InnerStruct {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
}

struct MiddleStruct {
    innerOpt: InnerStruct?; 
    strVal: String;
}

struct OuterStruct {
    midOpt: MiddleStruct?; 
    intVal: Int;
}

contract TestContract {
    storage: OuterStruct = OuterStruct{
        midOpt: null,
        intVal: 999
    };

    receive() {
        let _ = self.storage;
    }
}