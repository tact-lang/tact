struct OptBase {
    x: Int?;
    y: Bool?;
}

contract OptPersist {
    data: OptBase = OptBase{
        x: null,
        y: null
    };
}