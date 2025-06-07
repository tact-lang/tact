struct InnerStruct {
    f: Int;
}

contract DefaultsInStructField {
    data: InnerStruct = InnerStruct{ f: 5 };
}
