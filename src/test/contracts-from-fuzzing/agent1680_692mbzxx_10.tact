struct OptSer {
    x: Int? as int64;
    y: Int? as uint8;
    b: Bool?;
}

contract OptSerPersist {
    data: OptSer = OptSer{}; // defaults null everywhere
    receive() {}
}