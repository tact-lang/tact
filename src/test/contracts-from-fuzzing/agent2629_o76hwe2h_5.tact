contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    addressVal: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    cellVal: Cell? = null;
    builderVal: Builder? = null;
    sliceVal: Slice? = null;
    stringVal: String = "test";
    optionalInt: Int? = null;
    optionalBool: Bool? = null;
    optionalAddress: Address? = null;
    optionalCell: Cell? = null;
    optionalSlice: Slice? = null;
    optionalString: String? = null;
    
    init() {}
}