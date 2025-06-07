contract DeepNestedOptional {
    nestedField: InnerStruct;

    init() {
        self.nestedField = InnerStruct{};
    }
}

struct InnerStruct {
    maybeNested: StillDeeper?; // optional nested struct
}

struct StillDeeper {
    num: Int;
    flag: Bool;
}