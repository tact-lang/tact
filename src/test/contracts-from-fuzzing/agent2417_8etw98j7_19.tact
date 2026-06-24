struct OptionalPrimitives {
    intVal: Int?;
    boolVal: Bool?;
}

contract DefaultOptionals {
    v: OptionalPrimitives;

    init() {
        self.v = OptionalPrimitives{};
    }
}
