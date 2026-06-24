struct OnlyPrimitives {
    intField: Int = 1;
    boolField: Bool = false;
    strField: String = "default";
}

contract PrimitiveDefaults {
    data: OnlyPrimitives = OnlyPrimitives{};
}
