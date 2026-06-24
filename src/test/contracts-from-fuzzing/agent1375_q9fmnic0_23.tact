struct StructWithOptionals {
    x: Int?;
    y: Int?;
}

contract ContractWithOptionals(
    p: StructWithOptionals
) {
    // Should be allowed with optionals inside parameter
}