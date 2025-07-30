struct DeepOptionalFields {
    inner: InnerDeepOptional?;
}

struct InnerDeepOptional {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;
    addrVal: Address?;
}

contract TestDeepNestedOptional {
    data: DeepOptionalFields;

    init() {
        self.data = DeepOptionalFields{inner: null};
    }
}