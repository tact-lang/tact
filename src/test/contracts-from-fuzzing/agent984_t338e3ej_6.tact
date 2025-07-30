struct OptionalStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalStorage {
    opt: OptionalStruct = OptionalStruct{
        x: null,
        y: null,
        s: null
    };
}