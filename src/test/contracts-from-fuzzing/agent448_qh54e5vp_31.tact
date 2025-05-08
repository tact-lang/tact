struct Nested {
    value: Int;
    next: Inner?;
}

struct Inner {
    flag: Bool;
    data: DataStruct;
}

struct DataStruct {
    num: Int;
    text: String;
}

contract ParamSyntaxNestedFields(
    storageField: Nested,
) {}