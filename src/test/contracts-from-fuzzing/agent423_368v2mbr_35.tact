struct OptionalStruct {
    a: Int?;
}

contract OptionalStructAsField {
    val: OptionalStruct = OptionalStruct{ a: null };
}