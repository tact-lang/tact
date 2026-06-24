struct OptionalPrimitive {
    val: Int?;
}

contract OptionalAssign {
    store: OptionalPrimitive;
    init() {
        self.store = OptionalPrimitive{ val: null };
    }
}