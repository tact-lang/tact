struct NestedPrimitives {
    innerBool: Bool;
    innerString: String;
    innerAddr: Address;
}

struct PrimitiveStruct {
    boolVal: Bool;
    stringVal: String;
    addrVal: Address;
    nested: NestedPrimitives;
}

contract PrimitivesInNestedStruct {
    data: PrimitiveStruct;
    init() {
        self.data = PrimitiveStruct{
            boolVal: true,
            stringVal: "abc",
            addrVal: myAddress(),
            nested: NestedPrimitives{
                innerBool: false,
                innerString: "def",
                innerAddr: myAddress(),
            },
        };
    }
}