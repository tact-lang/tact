struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    optField: OptionalStruct = OptionalStruct{};
    init() {}
}