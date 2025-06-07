struct InnerBoolOption {
    b: Bool?;
}

contract OptionalBoolStruct {
    s: InnerBoolOption = InnerBoolOption{ b: null };
}