struct MaybeData {
    s: String?;
    n: Int?;
    f: Bool?;
}

contract AllOptionalStruct {
    info: MaybeData?;
    // implicit null, no init
}