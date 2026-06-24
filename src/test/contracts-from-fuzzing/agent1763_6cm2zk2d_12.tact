struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optSlice: Slice?;
    optStr: String?;
}

contract TestContract(data: ManyPrimitives) {
    receive() {
        let _ = self.data;
    }
}