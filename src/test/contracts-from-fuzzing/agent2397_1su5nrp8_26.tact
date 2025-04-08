struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullStructs {
    opt: OptionalStruct = OptionalStruct{ a: null, b: null, c: null };
    receive() {}
}