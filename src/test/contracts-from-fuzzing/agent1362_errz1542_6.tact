struct OptNestedStruct {
    innerOpt: OptStruct?;
}

struct OptStruct {
    val: Int?;
}

contract OptionalNestedStructField {
    optNested: OptNestedStruct = OptNestedStruct{ innerOpt: null };
}