struct OptionalSer {
    val: Int? as uint16;
}

contract OptionalSerStruct {
    s: OptionalSer;

    init() {
        self.s = OptionalSer{ val: 65535 };
    }
}