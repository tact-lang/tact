struct Details {
    field1: String = "default";
    field2: Int as uint8 = 42;
    optField: Bool?;
}

contract ParamTest(
    data: Details,
    active: Bool
) { }