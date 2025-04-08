struct OptionalConcrete {
    a: Int? = 10;
    b: Int? = 20;
    c: Bool? = true;
    d: String? = "hi";
    e: Int? = 0;
}

contract OptionalDefaultsStruct {
    val: OptionalConcrete = OptionalConcrete{};
}