struct SerializedNested {
    small: Int as uint8;
    mid: Int as int32;
    opt: Int?; 
}

contract ParamSerializationContract(
    nested: SerializedNested,
) {}
