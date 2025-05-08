struct OptionalPrimitive {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    addressVal: Address?;
}

contract TestContract {
    data: OptionalPrimitive;

    init() {
        self.data = OptionalPrimitive{};
    }
}