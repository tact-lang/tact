struct ComplexStruct {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    nestedOpt: NestedStruct?;
}

struct NestedStruct {
    nestedInt: Int?;
    nestedBool: Bool?;
    nestedAddr: Address?;
    nestedStr: String?;
}

contract ComplexStructHolder {
    field: ComplexStruct;

    init() {
        self.field = ComplexStruct{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "hello",
            nestedOpt: null,
        };
    }
}
