struct DeeplyNestedOptional {
    field1: Int?;
    field2: String?;
}

struct MidLevel {
    nested1: DeeplyNestedOptional?;
    nested2: DeeplyNestedOptional?;
}

contract ManyOptionals {
    val1: MidLevel? = null;
    val2: MidLevel? = null;
}
