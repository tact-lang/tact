struct InnerNestedStruct {
    a: Bool;
    b: Int?;
}

struct OuterNestedStruct {
    inner: InnerNestedStruct;
    optInt: Int?;
    s: String;
}

contract DeeplyNestedPersistent {
    data: OuterNestedStruct = OuterNestedStruct{
        inner: InnerNestedStruct{
            a: false,
            b: null,
        },
        optInt: null,
        s: "",
    };
}