// A struct with optional fields of all valid primitive types
struct OptAllPrims {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    strVal: String?;
}

contract TestContract {
    s: OptAllPrims;
    
    init() {
        self.s = OptAllPrims{
            intVal: null,
            boolVal: null,
            addrVal: null,
            cellVal: null,
            sliceVal: null,
            strVal: null
        };
    }
}