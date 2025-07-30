struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    optField: OptionalStruct = OptionalStruct{ a: null, b: null };
    init() {}
}