struct OptStruct {
    optInner: Int?;
}

contract OptionalStructField {
    optField: OptStruct = OptStruct{ optInner: null };
}