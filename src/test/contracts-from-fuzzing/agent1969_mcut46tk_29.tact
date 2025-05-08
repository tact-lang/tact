struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DefaultFieldInit {
    field: InnerStruct = InnerStruct{a: 1, b: false};
}