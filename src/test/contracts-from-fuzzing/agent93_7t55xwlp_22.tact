struct NestedOptionStruct {
    os1: Int?;
    os2: String?;
    os3: Bool?;
}

contract AllOptionNested {
    nested: NestedOptionStruct = NestedOptionStruct{ os1: null, os2: null, os3: null };
}