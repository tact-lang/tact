struct OptInt {
    value: Int?;
}

struct ContainerStruct {
    opt: OptInt?;
}

contract OptionalInOptionalStruct {
    s: ContainerStruct?;
}