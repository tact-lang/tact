struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: InnerStruct = InnerStruct{
        a: 1,
        b: true
    };
}