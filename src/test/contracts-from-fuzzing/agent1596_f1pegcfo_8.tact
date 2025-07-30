struct OptionalPrimitives {
    intVal: Int?; 
    boolVal: Bool?; 
    addrVal: Address?; 
    stringVal: String?; 
    cellVal: Cell?; 
    sliceVal: Slice?; 
}

contract Test {
    store: OptionalPrimitives = OptionalPrimitives{};
    init() {}
}