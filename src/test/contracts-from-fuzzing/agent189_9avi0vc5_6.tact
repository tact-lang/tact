struct DeepNested {
    val1: Int;
    val2: String?;
}

struct Outer {
    inside: DeepNested?;
}

contract NestedOptionStruct {
    field: Outer = Outer{};
}