struct InnerSerial {
    a: Int as uint8;
    b: Int? as uint32;
}

contract ParamSerial(
    count: Int as uint16,
    nested: InnerSerial,
) {}