struct OptStruct {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptionalStructFields {
    val: OptStruct = OptStruct{
        x: null,
        y: null,
        z: 42,
    };
}