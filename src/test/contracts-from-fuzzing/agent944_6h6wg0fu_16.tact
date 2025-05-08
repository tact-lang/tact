struct Params {
    id: Int as uint32;
    flag: Bool;
    optI: Int?;
    flag2: Bool?;
    text: String;
}

contract ParamDefaults(
    id: Int as uint32,
    flag: Bool,
    optI: Int?,
    flag2: Bool?,
    text: String,
) {
    // intentionally no init, params initialize fields.
}