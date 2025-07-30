struct DeepOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStruct {
    val: DeepOpt = DeepOpt{
        x: null,
        y: true,
        z: null,
    };
}