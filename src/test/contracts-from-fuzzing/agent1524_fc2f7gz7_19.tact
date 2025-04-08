// test optional nested primitives
struct NestPrim {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    addrVal: Address?;
}

contract OptNestPrim {
    s: NestPrim;
    
    init() {
        self.s = NestPrim{
            intVal: null,
            boolVal: null,
            strVal: null,
            cellVal: null,
            sliceVal: null,
            addrVal: null
        };
    }
}