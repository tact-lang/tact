struct PrimitivesNested {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addressVal: Address;
}

contract NestedPrimitives {
    inner: PrimitivesNested;

    init() {
        self.inner = PrimitivesNested{
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            addressVal: myAddress()
        };
    }
}