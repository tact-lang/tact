struct OptionalLayer2 {
    deep: Int?;
}

struct OptionalLayer1 {
    mid: OptionalLayer2?;
}

contract NestedNullable {
    val: OptionalLayer1 = OptionalLayer1{ mid: null };
}