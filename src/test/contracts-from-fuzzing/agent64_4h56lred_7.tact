struct NestedStructDefaults {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int = 123;
}

contract NestedDefaults {
    myData: NestedStructDefaults = NestedStructDefaults{ inner: InnerStruct{} };
}