struct OptionalPrimitivesDefaults {
    intVal: Int? = null;
    boolVal: Bool? = null;
    strVal: String? = null;
    addrVal: Address? = null;
    cellVal: Cell? = null;
    sliceVal: Slice? = null;
}

contract TestContract {
    d: OptionalPrimitivesDefaults;

    init() {
        self.d = OptionalPrimitivesDefaults{};
    }
}