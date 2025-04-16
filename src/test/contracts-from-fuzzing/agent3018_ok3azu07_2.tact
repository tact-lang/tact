struct InnerStruct {
    a: Int;
    b: String;
    optionalC: Bool?;
}

contract TestContract {
    nestedField: InnerStruct = InnerStruct{
        a: 1,
        b: "hello",
        optionalC: null,
    };
}
